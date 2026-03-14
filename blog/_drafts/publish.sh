#!/usr/bin/env bash
# =============================================================================
# publish.sh — Travel Document Vault Blog Publisher
# =============================================================================
# Usage:
#   ./blog/_drafts/publish.sh              — show schedule + what's due next
#   ./blog/_drafts/publish.sh --next       — publish whichever post is due next
#   ./blog/_drafts/publish.sh --schedule   — show full schedule and exit
#   ./blog/_drafts/publish.sh <slug>       — publish a specific post by slug
#
# Run from the root of your support-site repo (the folder containing blog/)
# =============================================================================

set -euo pipefail

# ── Colour helpers ────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BOLD='\033[1m'; NC='\033[0m'
info()    { echo -e "  ${BOLD}→${NC} $*"; }
success() { echo -e "  ${GREEN}✓${NC} $*"; }
error()   { echo -e "  ${RED}✗ ERROR:${NC} $*" >&2; exit 1; }
warn()    { echo -e "  ${YELLOW}⚠${NC} $*"; }

# ── Publishing schedule ───────────────────────────────────────────────────────
# FORMAT: "YYYY-MM-DD slug"  (chronological order — add new rows at the bottom)
SCHEDULE=(
  "2026-03-04 best-passport-organizer-app"
  "2026-03-11 what-documents-to-carry-when-travelling-internationally"
  "2026-03-14 travel-while-passport-renewal-pending"
  "2026-03-18 visa-expiry-tracker-app"
  "2026-03-25 digital-passport-copy-valid"
  "2026-04-08 safest-way-to-store-passport-digitally"
  "2026-04-15 child-travel-consent-letter"
  "2026-04-22 visa-vs-passport"
  "2026-04-29 passport-photo-at-home"
  "2026-05-06 travel-insurance-documents"
)

# ── Show schedule helper ──────────────────────────────────────────────────────
show_schedule() {
  local today
  today=$(date +%Y-%m-%d)
  echo ""
  echo -e "${BOLD}Publishing schedule:${NC}"
  echo ""
  for entry in "${SCHEDULE[@]}"; do
    local date slug status icon
    date="${entry%% *}"
    slug="${entry#* }"
    if [[ -d "blog/${slug}" ]]; then
      icon="${GREEN}✅ Published${NC}"
    elif [[ -f "blog/_drafts/${slug}/index.html" ]]; then
      if [[ "$date" < "$today" || "$date" == "$today" ]]; then
        icon="${YELLOW}⚡ Due now${NC}"
      else
        icon="${BOLD}✍️  Draft ready${NC}  (publish on ${date})"
      fi
    else
      icon="📝 Not yet written"
    fi
    printf "  %-12s  %-60s  " "$date" "$slug"
    echo -e "$icon"
  done
  echo ""
}

# ── Find next due post ────────────────────────────────────────────────────────
find_next() {
  local today
  today=$(date +%Y-%m-%d)
  for entry in "${SCHEDULE[@]}"; do
    local date slug
    date="${entry%% *}"
    slug="${entry#* }"
    # Skip already published
    [[ -d "blog/${slug}" ]] && continue
    # Must have a draft ready
    [[ ! -f "blog/_drafts/${slug}/index.html" ]] && continue
    # Return the first unpublished draft that exists
    echo "$slug"
    return 0
  done
  return 1
}

# ── Argument handling ─────────────────────────────────────────────────────────
if [[ $# -eq 0 ]]; then
  show_schedule
  NEXT=$(find_next 2>/dev/null || true)
  if [[ -n "$NEXT" ]]; then
    echo -e "  ${BOLD}Next to publish:${NC} ${NEXT}"
    echo ""
    echo -e "  Run: ${GREEN}./blog/_drafts/publish.sh --next${NC}"
    echo -e "  Or:  ${GREEN}./blog/_drafts/publish.sh ${NEXT}${NC}"
  else
    echo -e "  ${GREEN}All ready drafts are published.${NC}"
  fi
  echo ""
  exit 0
fi

if [[ "$1" == "--schedule" ]]; then
  show_schedule
  exit 0
fi

if [[ "$1" == "--next" ]]; then
  SLUG=$(find_next 2>/dev/null) || error "No draft-ready posts found. Check _drafts/ or README.md."
  echo ""
  echo -e "${BOLD}Auto-selected next post:${NC} ${SLUG}"
else
  SLUG="$1"
fi
DRAFT_DIR="blog/_drafts/${SLUG}"
BLOG_DIR="blog/${SLUG}"
BLOG_INDEX="blog/index.html"
INSERTION_MARKER='<div class="flex flex-col gap-4">'

# ── Validate inputs ───────────────────────────────────────────────────────────
[[ -d "$DRAFT_DIR" ]]            || error "Draft folder not found: ${DRAFT_DIR}"
[[ -f "${DRAFT_DIR}/index.html" ]] || error "No index.html in ${DRAFT_DIR} — draft not written yet"
[[ -f "$BLOG_INDEX" ]]           || error "blog/index.html not found. Run from the support-site root."
[[ ! -d "$BLOG_DIR" ]]           || error "blog/${SLUG} already exists — already published?"

echo ""
echo -e "${BOLD}Publishing:${NC} ${SLUG}"
echo "──────────────────────────────────────────────"

# ── Post card registry ────────────────────────────────────────────────────────
# Each entry is a heredoc keyed by slug. Add new slugs here as you write them.
# Keep cards in sync with _drafts/README.md.

get_card() {
  local slug="$1"
  case "$slug" in

  best-passport-organizer-app)
    cat <<'CARD'

          <!-- Best Passport Organizer App — Mar 4, 2026 -->
          <a href="best-passport-organizer-app/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-passport">Travel Tools</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Best Passport Organizer App in 2026: A Practical Guide for Families
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Not all passport organizer apps are built the same. Here's what to look for — and what to avoid — when choosing one for your family's travel documents.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-03-04">Mar 4, 2026</time>
                <span aria-hidden="true">·</span>
                <span>8 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  what-documents-to-carry-when-travelling-internationally)
    cat <<'CARD'

          <!-- What Documents to Carry — Mar 11, 2026 -->
          <a href="what-documents-to-carry-when-travelling-internationally/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-organisation">Travel Prep</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              What Documents to Carry When Travelling Internationally: The Complete List
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Passport, visa, insurance, children's consent letters — here's the complete document list for international travel, including what families often forget.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-03-11">Mar 11, 2026</time>
                <span aria-hidden="true">·</span>
                <span>9 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  visa-expiry-tracker-app)
    cat <<'CARD'

          <!-- Visa Expiry Tracker App — Mar 18, 2026 -->
          <a href="visa-expiry-tracker-app/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-renewal">Visas &amp; Entry</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Visa Expiry Tracker App: What to Look For and Why It Matters
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Visa tracking is more complex than passport tracking — entry validity, maximum stay, and Schengen rolling windows all need separate monitoring. Here's why it matters and what to look for in an app.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-03-18">Mar 18, 2026</time>
                <span aria-hidden="true">·</span>
                <span>8 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  digital-passport-copy-valid)
    cat <<'CARD'

          <!-- Digital Passport Copy — Mar 25, 2026 -->
          <a href="digital-passport-copy-valid/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-passport">Passport Rules</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Digital Passport Copy: What Counts as Valid ID When Travelling?
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Airlines, hotels, embassies, and border officers all treat digital passport copies differently. Here's exactly where a digital copy helps — and where you absolutely need the physical document.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-03-25">Mar 25, 2026</time>
                <span aria-hidden="true">·</span>
                <span>7 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  travel-while-passport-renewal-pending)
    cat <<'CARD'

          <!-- Can You Travel While Renewal Pending — Mar 14, 2026 -->
          <a href="travel-while-passport-renewal-pending/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-renewal">Renewal</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Can You Travel While Your Passport Is Being Renewed?
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Your renewal is submitted, your trip is booked — but can you still travel? The answer depends on whether you still have your passport. Here's the country-by-country breakdown.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-03-14">Mar 14, 2026</time>
                <span aria-hidden="true">·</span>
                <span>7 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  safest-way-to-store-passport-digitally)
    cat <<'CARD'

          <!-- Safest Way to Store Passport Digitally — Apr 8, 2026 -->
          <a href="safest-way-to-store-passport-digitally/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-privacy">Privacy &amp; Security</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              iCloud vs Google Photos vs Encrypted Vault: Safest Way to Store Your Passport
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              An honest comparison of the three most common ways people store passport scans digitally — what each one actually protects you from, and what it doesn't.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-04-08">Apr 8, 2026</time>
                <span aria-hidden="true">·</span>
                <span>7 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  child-travel-consent-letter)
    cat <<'CARD'

          <!-- Child Travel Consent Letter — Apr 15, 2026 -->
          <a href="child-travel-consent-letter/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-organisation">Family Travel</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Child Travel Consent Letter: When You Need One and What It Must Say
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Travelling with a child without both parents? Some borders will stop you without a consent letter. Here's when you need one, what it must include, and common mistakes that get it rejected.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-04-15">Apr 15, 2026</time>
                <span aria-hidden="true">·</span>
                <span>7 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  visa-vs-passport)
    cat <<'CARD'

          <!-- Visa vs Passport — Apr 22, 2026 -->
          <a href="visa-vs-passport/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-passport">Travel Essentials</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Visa vs Passport: What's the Difference and Why It Matters
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              A clear, jargon-free explainer for first-time international travellers — what each document is, why you need both, and how to check whether you need a visa for your destination.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-04-22">Apr 22, 2026</time>
                <span aria-hidden="true">·</span>
                <span>6 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  passport-photo-at-home)
    cat <<'CARD'

          <!-- How to Take a Passport Photo at Home — Apr 29, 2026 -->
          <a href="passport-photo-at-home/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-passport">Passport Rules</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              How to Take a Passport Photo at Home (That Actually Gets Accepted)
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Requirements by country, lighting tips, the most common rejection reasons, and how to get a print-ready shot using just your smartphone — no photo booth required.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-04-29">Apr 29, 2026</time>
                <span aria-hidden="true">·</span>
                <span>7 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  travel-insurance-documents)
    cat <<'CARD'

          <!-- Travel Insurance Documents — May 6, 2026 -->
          <a href="travel-insurance-documents/" class="post-card">
            <div class="flex items-center gap-2 mb-3">
              <span class="tag-pill tag-organisation">Travel Essentials</span>
            </div>
            <h2 class="text-xl font-bold text-white mb-2 leading-snug">
              Travel Insurance Documents: What to Save and Where to Keep Them
            </h2>
            <p class="text-blue-100/60 text-sm leading-relaxed">
              Most people buy travel insurance but can't find their policy number when they need it. Here's which documents actually matter, what to save before you fly, and how to access them abroad.
            </p>
            <div class="card-meta-row">
              <div class="flex items-center gap-2 text-blue-200/40 text-xs">
                <time datetime="2026-05-06">May 6, 2026</time>
                <span aria-hidden="true">·</span>
                <span>6 min read</span>
              </div>
              <span class="read-more-arrow" aria-hidden="true">Read →</span>
            </div>
          </a>
CARD
    ;;

  *)
    echo ""
    ;;

  esac
}

# ── Get the card HTML ─────────────────────────────────────────────────────────
CARD_HTML=$(get_card "$SLUG")

if [[ -z "$CARD_HTML" ]]; then
  warn "No post card registered for '${SLUG}'."
  warn "The draft will still be moved, but you must manually add a card to blog/index.html."
  warn "See _drafts/README.md for the card template."
  SKIP_CARD=true
else
  SKIP_CARD=false
fi

# ── Step 1: Update dates in the draft HTML to today ─────────────────────────
TODAY=$(date +%Y-%m-%d)
DRAFT_HTML="${DRAFT_DIR}/index.html"

info "Updating dates to ${TODAY} in draft HTML..."

python3 - "${DRAFT_HTML}" "${TODAY}" << 'PYDATE'
import sys, re
from datetime import datetime

html_path = sys.argv[1]
today_iso  = sys.argv[2]                                      # e.g. 2026-03-18
today_dt   = datetime.strptime(today_iso, "%Y-%m-%d")
today_disp = today_dt.strftime("%-d %B %Y")                   # e.g. 18 March 2026
# Also build Month D, YYYY format used in some posts
today_us   = today_dt.strftime("%B %-d, %Y")                  # e.g. March 18, 2026

with open(html_path, 'r') as f:
    html = f.read()

# JSON-LD datePublished / dateModified (plain date or with T time suffix)
html = re.sub(r'"datePublished":\s*"[\d\-T:Z]+"', f'"datePublished": "{today_iso}"', html)
html = re.sub(r'"dateModified":\s*"[\d\-T:Z]+"',  f'"dateModified": "{today_iso}"',  html)

# datetime="YYYY-MM-DD" attribute on <time> tags
html = re.sub(r'datetime="\d{4}-\d{2}-\d{2}"', f'datetime="{today_iso}"', html)

# Human-readable date inside <time>...</time> — handles "March 18, 2026" or "18 March 2026"
html = re.sub(
    r'(<time[^>]*>)[A-Z][a-z]+ \d{1,2},? \d{4}(</time>)',
    r'\g<1>' + today_us + r'\2',
    html
)

with open(html_path, 'w') as f:
    f.write(html)

print(f"  Dates updated to {today_iso} ({today_us})")
PYDATE

success "Dates updated to ${TODAY}"

# ── Step 2: Move the draft folder ─────────────────────────────────────────────
info "Moving ${DRAFT_DIR}/ → ${BLOG_DIR}/"
mv "$DRAFT_DIR" "$BLOG_DIR"
success "Draft moved to blog/${SLUG}/"

# ── Step 3: Insert the post card into blog/index.html ────────────────────────
if [[ "$SKIP_CARD" == false ]]; then
  info "Inserting post card into ${BLOG_INDEX}..."

  # Build the replacement: the marker + the new card (newest first)
  # We use awk to insert after the marker line
  TEMP_FILE=$(mktemp)
  awk -v marker="$INSERTION_MARKER" -v card="$CARD_HTML" '
    {
      print
      if (index($0, marker) > 0 && !inserted) {
        printf "%s\n", card
        inserted = 1
      }
    }
  ' "$BLOG_INDEX" > "$TEMP_FILE"

  mv "$TEMP_FILE" "$BLOG_INDEX"
  success "Post card inserted at top of article grid in blog/index.html"
else
  warn "Skipped blog/index.html update — add card manually."
fi

# ── Step 4: Summary ───────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}Done.${NC} Published: ${SLUG}"
echo ""
echo "  Next steps:"
echo ""
echo "  1. Do a quick read:"
echo "     open blog/${SLUG}/index.html"
echo ""
echo "  2. Check the blog index in your browser:"
echo "     open blog/index.html"
echo ""
echo "  3. Commit + push — pushing to main IS the deploy:"
echo "     git add blog/${SLUG} blog/index.html"
echo "     git commit -m \"publish: ${SLUG}\""
echo "     git push"
echo ""
echo "  GitHub Actions picks up the push and deploys to traveldocumentvault.com"
echo "  automatically (~2 min). You can watch it at:"
echo "  https://github.com/$(git remote get-url origin 2>/dev/null | sed 's/.*github.com[:/]\(.*\)\.git/\1/' || echo 'your-repo')/actions"
echo ""
echo "  4. Update _drafts/README.md: mark '${SLUG}' as ✅ Published"
echo ""
