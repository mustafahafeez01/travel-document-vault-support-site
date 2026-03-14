# Blog Drafts — Publishing Guide

This folder contains all unpublished blog drafts.

---

## Single source of truth

All blog planning and content lives in the **support-site repo** (`~/Github/support-site`):

| File | Purpose |
|------|---------|
| `blog/TOPIC_BACKLOG.md` | Master list of all planned and published posts (posts #1–50+) |
| `blog/BLOG_STYLE_GUIDE.md` | Writing standards, reading time formula, SEO rules |
| `blog/BLOG_POST_SYSTEM_PROMPT.md` | Full HTML spec and structure reference for Claude |
| `blog/_drafts/README.md` | This file — publishing workflow and schedule |
| `blog/_drafts/SOCIAL_CALENDAR.md` | 12-week social posting schedule |
| `blog/_drafts/[slug]/index.html` | Draft articles (not yet published) |
| `blog/_drafts/[slug]/social.md` | Social media posts for each article |
| `blog/[slug]/index.html` | Published articles (live on site) |
| `blog/[slug]/social.md` | Social posts for published articles |

**Nothing blog-related lives in the app repo (`travel-document-vault/docs/blogs/`).**
Those files are stubs that redirect here.

**Nothing in `_drafts/` or `*.md` files is ever deployed to the live site.**
The deploy.yml excludes them — only `blog/[slug]/index.html` files go live.

---

## Asking Claude to publish or write a draft

**To publish the next draft:**
> "Publish the next blog draft"

Claude will:
1. Read this README to find the next draft-ready post in the schedule table
2. Update all dates in the draft HTML to today's date (article meta + JSON-LD)
3. Move the folder from `blog/_drafts/[slug]/` → `blog/[slug]/`
4. Insert the post card manually into `blog/index.html` (after `<div class="flex flex-col gap-4">`)
5. Update this README: mark the post ✅ Published in both tables
6. Update `TOPIC_BACKLOG.md`: mark the post as Published with today's date
7. Show you the git commit command to run

**IMPORTANT — known script bug:** The `publish.sh` awk command fails silently on multi-line heredocs. Always insert the post card into `blog/index.html` manually using the Edit tool. Never rely on the script. After running, always verify: `grep [slug] blog/index.html`

**To write a new draft:**
> "Write the next blog draft" or "Write a draft for [topic]"

Claude will:
1. Check `blog/TOPIC_BACKLOG.md` for the highest-priority unwritten topic
2. Write the full HTML article using `blog/passport-expired-what-to-do/index.html` as the canonical reference — follow `blog/BLOG_POST_SYSTEM_PROMPT.md` for the full spec
3. Save to `blog/_drafts/[slug]/index.html`
4. Write social posts to `blog/_drafts/[slug]/social.md`
5. Add the post card HTML to the Post card summaries section below
6. Add the `case` block to `publish.sh`
7. Add the slug/title/date row to the schedule and posts tables in this README
8. Update `blog/TOPIC_BACKLOG.md` to mark the post as ✍️ Draft ready

---

## HTML structure every post MUST follow

Use `blog/passport-expired-what-to-do/index.html` as the canonical reference. The full spec is in `blog/BLOG_POST_SYSTEM_PROMPT.md`. Key rules:

- **Doctype:** `<!doctype html>` — lowercase. `charset="utf-8"` — lowercase.
- **CSS:** compact 30-line `<style>` block only (see BLOG_POST_SYSTEM_PROMPT.md) + `../../dist/output.css`. No additional component CSS.
- **JSON-LD:** all three schemas (BlogPosting, FAQPage, BreadcrumbList) go in `<head>`.
- **Nav:** `fixed` (not sticky), Tailwind classes, mobile drawer — copy exactly from reference.
- **Main layout:** `<main id="main" class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 pt-24 sm:pt-32">` → `<article class="max-w-[720px] mx-auto relative z-10">` → content → `</article>`
- **Article header:** `<header class="mb-10 animate-fade-in-down">` with category pill, h1, date/read time.
- **Glass panel:** `<div class="glass-panel rounded-2xl shadow-glass p-6 sm:p-12 animate-fade-in-up opacity-0">` wraps both takeaways and all prose.
- **Takeaways box:** `<div class="takeaways-box">` with `<h2>Key Takeaways</h2>` and `<ul>` — first thing inside glass panel.
- **FAQ items:** `<h3>` inside `.faq-item`. Questions must match FAQPage JSON-LD schema.
- **Mid-article CTA:** inline `<div>` nudge with text link — never a `<button>`.
- **Disclaimer:** `<section class="px-4 mb-8 mt-12">` with `glass-panel rounded-2xl` — outside `<article>`, inside `<main>`.
- **Bottom CTA:** `<section class="scroll-fade-in text-center space-y-6 pt-24 pb-24">` with App Store + Google Play badges.
- **App Store link:** `https://apps.apple.com/app/travel-document-vault/id6757014877`
- **Google Play link:** `https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault`
- **Footer:** `<footer class="text-center pt-20 pb-24 md:pb-10 space-y-4">` — standard links + `support@traveldocumentvault.com`
- **Scripts at bottom of body:** `../../assets/js/cookie-consent.js`, `../../assets/js/mobile-menu.js`, then scroll-fade-in observer.
- **Asset paths:** always `../../assets/` (two levels up from `blog/[slug]/`).

---

## Publishing Schedule

Publish **one post per week**, every Wednesday (or whenever ready).
Status: ✅ Published · ✍️ Draft ready · 📝 Not yet written

| Publish date | Slug | Status |
|-------------|------|--------|
| Mar 4, 2026 | `best-passport-organizer-app` | ✅ Published |
| Mar 9, 2026 | `passport-expired-what-to-do` | ✅ Published |
| Mar 11, 2026 | `what-documents-to-carry-when-travelling-internationally` | ✍️ Draft ready |
| Mar 14, 2026 | `travel-while-passport-renewal-pending` | ✅ Published |
| Mar 18, 2026 | `visa-expiry-tracker-app` | ✍️ Draft ready |
| Mar 25, 2026 | `digital-passport-copy-valid` | ✍️ Draft ready |
| Apr 8, 2026 | `safest-way-to-store-passport-digitally` | 📝 Not yet written |
| Apr 15, 2026 | `child-travel-consent-letter` | ✍️ Draft ready |
| Apr 22, 2026 | `visa-vs-passport` | ✍️ Draft ready |
| Apr 29, 2026 | `passport-photo-at-home` | ✍️ Draft ready |
| May 6, 2026 | `travel-insurance-documents` | ✍️ Draft ready |

---

## How to Publish Manually — Step by Step

### Step 1 — Run the publish script

```bash
cd ~/Github/support-site
./blog/_drafts/publish.sh [slug]
# or: ./blog/_drafts/publish.sh --next
```

The script automatically:
- Updates `datePublished` and `dateModified` in JSON-LD to today
- Updates `datetime="..."` on the `<time>` element
- Updates the human-readable displayed date (e.g. "March 18, 2026")
- Moves `blog/_drafts/[slug]/` → `blog/[slug]/`
- Attempts to insert the post card into `blog/index.html` (may fail — verify Step 2)

### Step 2 — Verify card in blog/index.html

The card insertion step sometimes fails silently. Always verify:
```bash
grep "[slug]" blog/index.html
```
If missing, insert manually from the Post card summaries section below.

### Step 3 — Insert post card into blog/index.html

Find `<div class="flex flex-col gap-4">` and insert the card (from Post card summaries below) immediately after it, newest first. Verify:
```bash
grep "[slug]" blog/index.html
```

### Step 4 — Commit and push

```bash
git add blog/[slug] blog/index.html blog/_drafts/README.md blog/TOPIC_BACKLOG.md
git commit -m "publish: [slug]"
git push
```

### Step 5 — Update this README and TOPIC_BACKLOG.md

- Mark ✅ Published in the schedule and posts tables here
- Mark as Published with date in `blog/TOPIC_BACKLOG.md`

### Step 6 — Update internal links (optional but good)

Check if any existing published posts should link to the new post in their "Read Next" aside.

---

## Tag pill reference

| Class | Use for |
|-------|---------|
| `tag-passport` | Passport rules, digital copies, validity |
| `tag-renewal` | Renewal timelines, expired passport, renewal pending |
| `tag-organisation` | Family docs, checklists, insurance docs, consent letters |
| `tag-privacy` | Security, storage, iCloud vs Google Photos |
| `tag-story` | Founder story only |

---

## Posts in this folder (drafts)

| # | Slug | Title | Target date | Tag | Status |
|---|------|-------|------------|-----|--------|
| 6 | `what-documents-to-carry-when-travelling-internationally` | What Documents to Carry When Travelling Internationally | Mar 11, 2026 | `tag-organisation` | ✍️ Draft ready |
| 7 | `visa-expiry-tracker-app` | Visa Expiry Tracker App: What to Look For and Why It Matters | Mar 18, 2026 | `tag-renewal` | ✍️ Draft ready |
| 9 | `digital-passport-copy-valid` | Digital Passport Copy: What Counts as Valid ID When Travelling? | Mar 25, 2026 | `tag-passport` | ✍️ Draft ready |
| 11 | `safest-way-to-store-passport-digitally` | iCloud vs Google Photos vs Encrypted Vault | Apr 8, 2026 | `tag-privacy` | 📝 Not yet written |
| 12 | `child-travel-consent-letter` | Child Travel Consent Letter: When You Need One | Apr 15, 2026 | `tag-organisation` | ✍️ Draft ready |
| 13 | `visa-vs-passport` | Visa vs Passport: What's the Difference | Apr 22, 2026 | `tag-passport` | ✍️ Draft ready |
| 14 | `passport-photo-at-home` | How to Take a Passport Photo at Home | Apr 29, 2026 | `tag-passport` | ✍️ Draft ready |
| 15 | `travel-insurance-documents` | Travel Insurance Documents: What to Save | May 6, 2026 | `tag-organisation` | ✍️ Draft ready |

---

## Post card summaries (copy-paste ready for blog/index.html)

### best-passport-organizer-app
```html
<a href="best-passport-organizer-app/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-passport">Travel Tools</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Best Passport Organizer App in 2026: A Practical Guide for Families</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Not all passport organizer apps are built the same. Here's what to look for — and what to avoid — when choosing one for your family's travel documents.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-03-04">Mar 4, 2026</time><span aria-hidden="true">·</span><span>8 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### what-documents-to-carry-when-travelling-internationally
```html
<a href="what-documents-to-carry-when-travelling-internationally/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-organisation">Travel Prep</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">What Documents to Carry When Travelling Internationally: The Complete List</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Passport, visa, insurance, children's consent letters — the complete document list for international travel, including what families often forget.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-03-11">Mar 11, 2026</time><span aria-hidden="true">·</span><span>9 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### visa-expiry-tracker-app
```html
<a href="visa-expiry-tracker-app/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-renewal">Visas &amp; Entry</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Visa Expiry Tracker App: What to Look For and Why It Matters</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Visa tracking is more complex than passport tracking. Entry validity, maximum stay, and Schengen rolling windows all need separate monitoring.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-03-18">Mar 18, 2026</time><span aria-hidden="true">·</span><span>8 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### digital-passport-copy-valid
```html
<a href="digital-passport-copy-valid/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-passport">Passport Rules</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Digital Passport Copy: What Counts as Valid ID When Travelling?</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Airlines, hotels, embassies, and border officers all treat digital passport copies differently. Here's exactly where a digital copy helps — and where you need the physical document.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-03-25">Mar 25, 2026</time><span aria-hidden="true">·</span><span>7 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### travel-while-passport-renewal-pending
```html
<a href="travel-while-passport-renewal-pending/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-renewal">Renewal</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Can You Travel While Your Passport Is Being Renewed?</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Your renewal is submitted, your trip is booked — but can you still travel? The answer depends on whether you still have your passport. Country-by-country breakdown.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-03-14">Mar 14, 2026</time><span aria-hidden="true">·</span><span>7 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### child-travel-consent-letter
```html
<a href="child-travel-consent-letter/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-organisation">Family Travel</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Child Travel Consent Letter: When You Need One and What It Must Say</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Travelling with a child without both parents? Some borders will stop you without a consent letter. Here's when you need one, what it must include, and common mistakes.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-04-15">Apr 15, 2026</time><span aria-hidden="true">·</span><span>7 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### visa-vs-passport
```html
<a href="visa-vs-passport/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-passport">Travel Essentials</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Visa vs Passport: What's the Difference and Why It Matters</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">A clear, jargon-free explainer for first-time international travellers — what each document is, why you need both, and how to check whether you need a visa for your destination.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-04-22">Apr 22, 2026</time><span aria-hidden="true">·</span><span>6 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### passport-photo-at-home
```html
<a href="passport-photo-at-home/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-passport">Passport Rules</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">How to Take a Passport Photo at Home (That Actually Gets Accepted)</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Requirements by country, lighting tips, the most common rejection reasons, and how to get a print-ready shot using just your smartphone.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-04-29">Apr 29, 2026</time><span aria-hidden="true">·</span><span>7 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```

### travel-insurance-documents
```html
<a href="travel-insurance-documents/" class="post-card">
  <div class="flex items-center gap-2 mb-3"><span class="tag-pill tag-organisation">Travel Essentials</span></div>
  <h2 class="text-xl font-bold text-white mb-2 leading-snug">Travel Insurance Documents: What to Save and Where to Keep Them</h2>
  <p class="text-blue-100/60 text-sm leading-relaxed">Most people buy travel insurance but can't find their policy number when they need it. Here's which documents actually matter and how to access them abroad.</p>
  <div class="card-meta-row">
    <div class="flex items-center gap-2 text-blue-200/40 text-xs"><time datetime="2026-05-06">May 6, 2026</time><span aria-hidden="true">·</span><span>6 min read</span></div>
    <span class="read-more-arrow" aria-hidden="true">Read →</span>
  </div>
</a>
```
