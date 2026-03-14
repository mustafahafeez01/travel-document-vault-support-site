# Blog Creation Style Guide

> Comprehensive guide for creating SEO-optimized, legally safe, gold-standard blog posts for traveldocumentvault.com.

---

## Skills Workflow

Run these Claude Code skills in order for every new blog post:

1. **`/content-creator`** - Brand voice, SEO keyword research, content structure, CTA generation
2. **`/senior-ux-designer`** - Visual consistency, spacing, typography, accessibility audit
3. **`/social-content`** - Social media repurposing (LinkedIn, Twitter/X, Instagram)

---

## Reading Time Calculation

**Standard: 238 WPM** (Medium / Substack industry standard)

```
Reading Time = ceil(article_body_word_count / 238)
```

**Rules:**
- Count words inside `<article>` body only (exclude nav, footer, related articles, HTML tags)
- Round up to nearest whole minute
- Minimum: 3 min (posts shorter than this feel insubstantial)
- Target range: 5–8 min (optimal engagement for SEO + retention)
- Display format: `7 min read`

**Quick reference:**
| Words | Reading Time |
|-------|-------------|
| 700 | 3 min |
| 1,200 | 6 min |
| 1,450 | 7 min |
| 1,900 | 8 min |
| 2,400 | 11 min |

---

## Blog Post Template

Every post must include ALL of the following. See any existing post (e.g. `passport-expiry-6-month-rule/index.html`) as a reference implementation.

### Required `<head>` Elements

```html
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#003A87">

  <!-- SEO metadata -->
  <title>[60 chars max - primary keyword near front]</title>
  <meta name="description" content="[155 chars max - includes primary keyword + CTA]">
  <link rel="canonical" href="https://traveldocumentvault.com/blog/[slug]/">

  <!-- Open Graph -->
  <meta property="og:title" content="[Same as title]">
  <meta property="og:description" content="[Same as meta description]">
  <meta property="og:image" content="https://traveldocumentvault.com/assets/images/social-preview.png">
  <meta property="og:url" content="https://traveldocumentvault.com/blog/[slug]/">
  <meta property="og:type" content="article">
  <meta property="og:image:width" content="1200">
  <meta property="og:image:height" content="630">

  <!-- Twitter -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="[Same as title]">
  <meta name="twitter:description" content="[Same as meta description]">
  <meta name="twitter:image" content="https://traveldocumentvault.com/assets/images/social-preview.png">

  <link rel="icon" type="image/svg+xml" href="/assets/images/app_icon.svg">
  <link rel="apple-touch-icon" href="/assets/images/app_icon.svg">
</head>
```

### Required JSON-LD Structured Data

Every post needs **three** schema blocks:

#### 1. BlogPosting

```json
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "[Full title]",
  "description": "[Meta description]",
  "image": "https://traveldocumentvault.com/assets/images/social-preview.png",
  "author": {
    "@type": "Organization",
    "name": "Travel Document Vault",
    "url": "https://traveldocumentvault.com"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Travel Document Vault",
    "logo": {
      "@type": "ImageObject",
      "url": "https://traveldocumentvault.com/assets/images/app_icon.svg"
    }
  },
  "datePublished": "YYYY-MM-DD",
  "dateModified": "YYYY-MM-DD",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://traveldocumentvault.com/blog/[slug]/"
  }
}
```

> **For personal/founder posts:** Use `"@type": "Person"` with `"name": "Mustafa Hafeez"` for author.

#### 2. FAQPage (if post has Q&A content)

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "[Question text]",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "[Answer text - plain text, no HTML]"
      }
    }
  ]
}
```

#### 3. BreadcrumbList

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://traveldocumentvault.com/" },
    { "@type": "ListItem", "position": 2, "name": "Blog", "item": "https://traveldocumentvault.com/blog/" },
    { "@type": "ListItem", "position": 3, "name": "[Short title]", "item": "https://traveldocumentvault.com/blog/[slug]/" }
  ]
}
```

### Navigation (Must Match All Pages)

Desktop and mobile nav must include these links in this exact order:
1. Home (`/`)
2. Features (`/features/`)
3. Why Us (`/why-us/`)
4. Blog (`/blog/`)
5. Why I Built This (`/blog/why-i-built-travel-document-vault/`)
6. Pricing (`/#pricing`)
7. FAQ (`/faq/`)
8. Privacy (`/privacy-policy/`)

**Rule:** Blog always comes before Why I Built This. This order must be identical on every page sitewide.

### Disclaimer Pattern

**Every informational post** (not founder story) needs ONE disclaimer at the bottom only. No top disclaimer - it's redundant and looks odd to readers.

#### Bottom disclaimer (end of article, in the glass-panel section):

```html
<section class="px-4 mb-8 mt-12">
  <div class="glass-panel rounded-2xl p-6 sm:p-8 text-center max-w-3xl mx-auto">
    <p class="text-slate-50 text-sm leading-relaxed">
      <strong class="text-slate-200">Disclaimer:</strong> [Post-specific disclaimer text].
      The author and publisher accept no liability for decisions made based on this content.
    </p>
  </div>
</section>
```

**Spacing:** `mt-12 mb-8` gives the disclaimer proper breathing room between the article and the CTA. Do not use `mt-6 mb-6` - that's too tight.

**Post-specific disclaimer text:**
- Passport rules: "Passport validity rules vary by country, change without notice, and depend on your nationality. Always check with your government's official travel advisory and your airline before booking."
- Renewal times: "Passport processing times change frequently and vary by individual circumstance. Always check your country's official passport authority website for current times before applying."
- Privacy/security: "Platform policies and security practices change over time. Always review the current terms of any service before storing sensitive personal documents."
- Family docs: "Travel document requirements vary by destination, nationality, and individual circumstance. Always verify current requirements with official government sources before travelling."

### Page Structure (Sitewide)

#### `<body>` tag (all pages)

```html
<body class="bg-gradient-to-b from-[#003A87] to-[#0A192F] font-sans antialiased text-slate-200 min-h-screen selection:bg-brand-gold selection:text-white">
```

No `overflow-x-hidden`. No ambient blobs. No `selection:text-brand-blue`. This applies to **all** pages including blog posts.

#### `<main>` tag (blog posts)

Blog post `<main>` must use `max-w-6xl mx-auto` to match the sitewide container:

```html
<main id="main" class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 pt-24 pb-12 sm:pt-32 sm:pb-20">
```

The article content inside uses `<div class="max-w-[720px] mx-auto relative z-10">` to keep prose at comfortable reading width.

#### Bottom half structure (blog posts)

`<main>` must wrap **all** bottom-half content — article, CTA, and footer — and close after `</footer>`:

```html
<main id="main" class="max-w-6xl mx-auto ...">
  <div class="max-w-[720px] mx-auto relative z-10">
    <!-- article content -->
  </div>

  <!-- CTA Section -->
  <section class="scroll-fade-in text-center space-y-6 pt-24 pb-24">
    ...
  </section>

  <!-- Footer -->
  <footer class="text-center pt-20 pb-24 space-y-4">
    ...
  </footer>
</main>
```

**No `<div class="max-w-6xl">` wrapper around the CTA section** — `<main>` already provides the constraint.

### Bottom Half Standard (Sitewide)

Every page that has a download CTA must use the canonical pattern below. This is the **defined sitewide standard** — no variation allowed.

#### Canonical bottom CTA template:

```html
<!-- CTA Section — no wrapper div needed; main already provides max-w-6xl -->
<section class="scroll-fade-in text-center space-y-6 pt-24 pb-24">
  <h2 class="text-3xl sm:text-4xl font-bold text-white">[PAGE-SPECIFIC H2]</h2>
  <p class="text-blue-200/70 text-lg max-w-xl mx-auto">[PAGE-SPECIFIC SUBTITLE]</p>
  <div class="flex flex-col sm:flex-row items-center justify-center gap-8">
    <a href="https://apps.apple.com/app/travel-document-vault/id6757014877"
       target="_blank" rel="noopener noreferrer"
       onclick="gtag('event', 'download_click', {'event_category': 'conversion', 'event_label': '[PAGE_LABEL]_bottom_cta_appstore'});"
       class="group relative inline-flex items-center transition-transform active:scale-95">
      <div class="absolute -inset-1 bg-gradient-to-r from-brand-gold to-yellow-500 rounded-lg blur opacity-25 group-hover:opacity-50 transition duration-200"></div>
      <img loading="lazy" src="../../assets/images/app-store-badge-black.svg"
           alt="Download on the App Store" class="relative h-[56px] w-auto" width="120" height="40" />
    </a>
    <div class="inline-flex items-center gap-3 h-[56px]">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-emerald-400/80 flex-shrink-0" viewBox="0 0 24 24" fill="currentColor">
        <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/>
      </svg>
      <div class="flex flex-col justify-center gap-0.5">
        <span class="text-[11px] font-medium text-slate-400 uppercase tracking-wide leading-tight">Coming Early 2026</span>
        <span class="text-[15px] font-semibold text-slate-100 leading-tight">Android</span>
      </div>
    </div>
  </div>
</section>
```

#### Rules (non-negotiable):
- `scroll-fade-in` class is **mandatory** on the outer `<section>` — every page, no exceptions
- `pt-24 pb-24` — gives breathing room above and below the CTA
- **No `border-t`** above the CTA section — ever, on any page. No visual divider line.
- **No** subscription/footnote text below the buttons — not `One-time purchase · No subscription*`, not the footnote `<p>`. That text belonged to the old pattern.
- **No `<div class="max-w-6xl">` wrapper** around the CTA section on blog posts — `<main>` provides the constraint. On home/features/why-us pages the CTA is inside a `max-w-6xl` main container already.
- Every page gets a **unique h2 and subtitle** — no two pages may share the same copy
- `gtag` label must be unique per page (use the slug, e.g. `blog_6month_bottom_cta_appstore`)

#### Footer spacing (all pages):
```html
<footer class="text-center pt-20 pb-24 space-y-4">
```
- `pt-20` — breathing room above footer links
- `pb-24` — comfortable bottom padding before end of page (NOT `pb-8` or `pb-16` — too tight)

#### scroll-fade-in CSS + JS (required in every blog post):

Blog posts do not inherit the scroll observer from main pages. Add these to every blog post HTML file.

**CSS** (in `<style>` block):
```css
.scroll-fade-in {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}
.scroll-fade-in.visible {
  opacity: 1;
  transform: translateY(0);
}
```

**JS** (inline `<script>` before `</body>`):
```javascript
document.addEventListener('DOMContentLoaded', function() {
  var observer = new IntersectionObserver(function(entries) {
    entries.forEach(function(entry) {
      if (entry.isIntersecting) { entry.target.classList.add('visible'); }
    });
  }, { root: null, rootMargin: '50px', threshold: 0.1 });
  document.querySelectorAll('.scroll-fade-in').forEach(function(el) {
    var rect = el.getBoundingClientRect();
    if (rect.top < window.innerHeight && rect.bottom > 0) { el.classList.add('visible'); }
    observer.observe(el);
  });
});
```

#### Unique CTA copy per page:

| Page | H2 | Subtitle |
|------|----|----------|
| Home | Set It Up Tonight | Keep existing |
| Features | Download Free. No Subscription. | Keep existing |
| Why Us | Stop Worrying About Expiry Dates | Everything in one place. No accounts, no subscriptions, no surprises. |
| Blog Index | The Last Time You'll Scramble Before a Trip | Scan your family's passports tonight. Expiry reminders set themselves. AES-256 encrypted, stored only on your device. |
| Why I Built This | The App I Wish I'd Had | If you're the person in your family who keeps track of everything - this is for you. Scan once, stop worrying forever. |
| 6-Month Rule | One Less Thing Before the Airport | Keep existing |
| Passport Renewal | Renewal Timelines Are Tricky. Reminders Aren't. | Keep existing |
| Family Docs | The Pre-Trip Checklist That Runs Itself | Keep existing |
| Google Photos | Your Passport Deserves Actual Encryption | Keep existing |
| Travel Checklist | Every Document. Every Person. Every Trip. | Keep existing |
| Lost Passport | A Backup Copy Could Get You Home Faster | Keep existing |
| Passport Expired | Set the Reminder Now, Not After It Expires | Keep existing |

**Exempt pages** (no download CTA): Privacy Policy, Terms of Service, Pricing Policy, Accessibility, FAQ.

---

### CTA Pattern

Each post gets a **unique CTA** - not generic. Use `/content-creator` to generate 3–4 options per post, then pick the best.

**CTA criteria:**
- Emotional, not functional (evoke feeling, not feature)
- 6–10 words max
- No exclamation marks
- Connects the article's pain point to the app's solution

**Examples from existing posts:**
| Post | CTA headline |
|------|-------------|
| 6-Month Rule | One Less Thing Before the Airport |
| Family Docs | The Pre-Trip Checklist That Runs Itself |
| Passport Renewal | Renewal Timelines Are Tricky. Reminders Aren't. |
| Google Photos Safety | Your Passport Deserves Actual Encryption |
| Travel Document Checklist | Every Document. Every Person. Every Trip. |
| Lost Passport Abroad | A Backup Copy Could Get You Home Faster |
| Passport Expired | Set the Reminder Now, Not After It Expires |
| Founder Story | The App I Wish I'd Had |
| Blog Index | The Last Time You'll Scramble Before a Trip |

### Related Articles Section

Every post includes 2–3 related articles at the bottom:

```html
<aside class="mt-12" aria-label="Related articles">
  <h2 class="text-xs font-bold text-blue-200/40 uppercase tracking-widest mb-4">Related Articles</h2>
  <div class="flex flex-col gap-3">
    <a href="../[slug]/" class="post-card" style="padding: 0.75rem 1rem;">
      <div class="flex items-center gap-2 mb-3">
        <span class="tag-pill tag-[category]">[Category]</span>
        <span class="text-blue-200/40 text-xs">7 min read · [Date]</span>
      </div>
      <p class="text-white font-semibold text-sm leading-snug">[Title]</p>
    </a>
  </div>
</aside>
```

**Required CSS** (must be in each post's `<style>` block):

```css
.post-card {
  background: rgba(17, 25, 40, 0.6);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 16px;
  transition: border-color 0.2s ease, transform 0.2s ease;
  text-decoration: none;
  display: block;
}
.post-card:hover {
  border-color: rgba(255, 176, 0, 0.3);
  transform: translateY(-2px);
}
.tag-pill {
  display: inline-block;
  padding: 2px 10px;
  border-radius: 999px;
  font-size: 0.7rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.04em;
}
.tag-passport { background: rgba(59,130,246,0.15); color: #93bbfd; }
.tag-organisation { background: rgba(168,85,247,0.15); color: #c4b5fd; }
.tag-renewal { background: rgba(34,197,94,0.15); color: #86efac; }
.tag-privacy { background: rgba(239,68,68,0.15); color: #fca5a5; }
.tag-story { background: rgba(255,176,0,0.15); color: #fbbf24; }
```

### Article Structure

```
1. Breadcrumb nav
2. H1 title
3. Author byline + reading time + date
4. Article body
   - H2 sections (2-5 keyword-rich subheadings)
   - H3 subsections as needed
   - Bold key phrases for scanning
   - FAQ section with H3 questions (feeds FAQPage schema)
5. App CTA section (unique per post)
6. Bottom disclaimer (glass-panel, "Important:" label)
7. Related Articles (2-3 cards)
```

### Author Byline

- **Informational posts:** `Travel Document Vault`
- **Founder/personal posts:** `Mustafa Hafeez, Founder`

---

## SEO Checklist (Per Post)

Run through before publishing:

- [ ] Primary keyword in: title, meta description, H1, first paragraph, 1-2 H2s, URL slug
- [ ] Keyword density: 1–2% (natural, not stuffed)
- [ ] Meta description: under 155 chars, includes keyword + benefit
- [ ] Title tag: under 60 chars, keyword near front
- [ ] URL slug: lowercase, hyphenated, 3-6 words, includes keyword
- [ ] H2 subheadings use secondary keywords naturally
- [ ] Internal links: link to 2-3 other blog posts + homepage
- [ ] External links: every factual claim backed by a real official link (see Official Sources rule below)
- [ ] Image alt text includes keyword (when images are added)
- [ ] BlogPosting JSON-LD: complete with dates, author, publisher
- [ ] FAQPage JSON-LD: 3-5 questions using "People Also Ask" phrasing
- [ ] BreadcrumbList JSON-LD: 3-level hierarchy
- [ ] Open Graph tags: title, description, image, URL, type
- [ ] Twitter Card tags: card type, title, description, image
- [ ] Canonical URL set correctly
- [ ] Reading time calculated and displayed (238 WPM)
- [ ] Nav links match all other pages
- [ ] Added to blog index page (newest first)
- [ ] Related Articles section links to 2-3 relevant posts
- [ ] Related Articles section in other posts updated to link back

---

## Official Sources Rule (Non-Negotiable)

**Every factual claim must be backed by a real official source. No made-up processing times, invented statistics, or unverified rules.**

### Required official sources by topic:

**US passport:** https://travel.state.gov/content/travel/en/passports.html
**UK passport:** https://www.gov.uk/apply-renew-passport
**Australia passport:** https://www.passports.gov.au
**Canada passport:** https://www.canada.ca/en/immigration-refugees-citizenship/services/canadian-passports.html
**New Zealand passport:** https://www.passports.govt.nz
**Ireland passport:** https://www.ireland.ie/en/dfa/passports/
**Entry requirements (airline database):** https://www.iatatravelcentre.com
**UK foreign travel advice:** https://www.gov.uk/foreign-travel-advice
**US travel advisories:** https://travel.state.gov
**Australia travel advisories:** https://www.smartraveller.gov.au

### Rules:
- Every processing time quoted must link to the official passport authority page
- Every entry requirement stated must link to either the official government advisory or IATA Travel Centre
- Do not quote specific timelines as fact unless you have verified them against the official source
- If you cannot verify a claim against an official source, rephrase it as general guidance and add "check your country's official passport authority for current timelines"
- Never invent statistics - if a statistic cannot be sourced, cut it

---

## AI Search Optimisation (AIO/GEO)

AI search engines (ChatGPT, Perplexity, Google AI Overviews) prioritise content that is factual, cites authoritative sources, and directly answers questions. Follow these rules for every post:

### Structured for AI extraction:
- **Direct answers first** - answer the question in the first sentence of each section, then elaborate. AI models extract the first direct answer.
- **Use the exact question as H2/H3** - AI systems match user queries to headings. "Can I travel while my passport is being renewed?" as a heading ranks better than "Travelling During Renewal"
- **FAQPage schema** - all FAQ questions must also appear as visible H3 headings in the article body. Schema without visible content gets lower trust signals.
- **Cite official sources with links** - AI systems weight content higher when claims are backed by gov.uk, travel.state.gov, etc. Always link; never paraphrase without attribution.
- **No AI slop** - remove vague, hedged, padded language. Every sentence should add information. AI models penalise thin content.

### Bottom CTA section:
Use the canonical template from **"Bottom Half Standard (Sitewide)"** in the CTA Pattern section above. Key rules: `scroll-fade-in` on the outer `<section>`, `pb-24`, no subscription/footnote text below buttons, unique h2 per page.

---

## Primary Personas

Write for these 3 personas. Every post should serve at least one of them explicitly.

### 1. Anxious Parent (~40% of audience)
- **Pain:** Responsible for multiple people's documents, terrified of ruining a family trip
- **Searches:** family travel documents, child passport requirements, consent letter, organise travel documents for family
- **Write for them by:** Using family scenarios in examples, calling out child-specific rules explicitly, reassuring tone
- **CTA angle:** "handles every family member automatically"

### 2. Frequent Business Traveller (~30%)
- **Pain:** Multiple passports, work visas, tight deadlines, employer complications
- **Searches:** travel while passport renewal pending, dual passport which to use, expedited passport, business travel documents
- **Write for them by:** Covering dual passport/visa scenarios, mentioning employer implications, efficiency-focused tone
- **CTA angle:** "one place for all your travel IDs"

### 3. First-Time International Flyer (~30%)
- **Pain:** Doesn't know what they don't know, afraid of getting something wrong
- **Searches:** what documents do I need to travel, 6 month passport rule, do I need a visa
- **Write for them by:** Explaining rules from first principles, not assuming prior knowledge, calm reassuring tone
- **CTA angle:** "won't let anything slip through"

### Mid-Article CTA Pattern

Every post needs one inline nudge mid-article (in addition to the full CTA at the bottom). Place it after a pain-point section, before the solution section.

```html
<div style="background: rgba(255,176,0,0.06); border: 1px solid rgba(255,176,0,0.15); border-radius: 10px; padding: 1rem 1.25rem; margin: 2rem 0;">
  <p style="margin: 0; font-size: 0.9rem; color: rgba(219,234,254,0.85); line-height: 1.6;">
    <strong style="color: #FFB000;">Travel Document Vault</strong> [specific benefit matching the section above]. <a href="https://apps.apple.com/app/travel-document-vault/id6757014877" target="_blank" rel="noopener noreferrer" style="color: #FFB000;">Free on the App Store.</a>
  </p>
</div>
```

### Content Funnel Mapping

| Stage | Intent | CTA Strength | Example Posts |
|-------|--------|-------------|---------------|
| Awareness | Learning about a topic | Soft mention | 6-month rule, passport storage |
| Consideration | Planning and comparing options | Mid-article nudge + bottom CTA | Family docs, renewal guide |
| Decision | Ready to act, high urgency | Strong CTAs throughout | Lost passport, expired passport |

Every post should link to at least one post in each adjacent funnel stage.

---

## Content Guidelines

### Tone & Voice
- **Calm, reassuring, knowledgeable** - like a well-travelled friend giving honest advice, not a corporate website
- British English spelling (traveller, organised, colour)
- Second person ("you") throughout - direct and personal
- Short paragraphs: 2-3 sentences max. One idea per paragraph.
- Use contractions freely (it's, you'll, don't, that's) - they sound human
- No jargon without a plain-English explanation immediately after
- Inform, don't scare - state facts calmly, not dramatically

### Writing Quality: Active Over Passive

**Write in active voice. Always.**

Passive voice is the single biggest sign of AI-generated text. It makes sentences longer, flatter, and harder to read.

| Passive (avoid) | Active (use) |
|---|---|
| "The rule is enforced by many countries" | "Many countries enforce this rule" |
| "Boarding may be denied" | "The airline can deny you boarding" |
| "Documents should be checked" | "Check your documents" |
| "It is recommended that..." | "We recommend..." |
| "Processing times are affected by..." | "Peak season slows processing times" |

**Quick test:** If you can add "by zombies" after the verb and it still makes sense, it's passive. "Boarding may be denied by zombies" - passive. Rewrite it.

### Readability: Easy on the Eye

Every post should pass the "skim test" - a reader should get 80% of the value just from scanning bold text, subheadings, and bullet points.

**Formatting rules:**
- **Bold** the most important phrase in every 3-4 paragraphs - the thing you'd underline if reading on paper
- Use bullet points for any list of 3+ items - never write them as a long sentence
- Break up walls of text with a subheading every 200-300 words
- Use a `takeaways-box` or `checklist-box` for scannable summaries
- **Takeaways-box uses `display: block` + `padding-left` for bullet arrows** - NOT `display: flex`. The correct CSS uses `position: absolute` for the `→` arrow so all text flows as a single block. Never use `display: flex` on `.takeaways-box li` - it caused a two-column split on mobile where bold text rendered as a separate flex column. `<strong>` tags inside list items are fine with the correct CSS.
- Short sentences land harder than long ones. Use them for emphasis.
- Vary sentence length - short. Then a slightly longer one that builds on it. Then short again.

### Banned Words & Phrases

These phrases signal AI-written content. Never use them:

| Banned | Use instead |
|---|---|
| "It is worth noting that..." | Just say the thing |
| "It is important to note..." | Just say the thing |
| "In conclusion..." | Just end the post |
| "Furthermore" / "Moreover" / "Additionally" | "Also" or restructure |
| "Delve into" | "Look at" / "cover" / "explain" |
| "In today's world..." | Cut it entirely |
| "Navigating [topic]" | Be specific |
| "A comprehensive guide to..." | Just write the guide |
| "It goes without saying..." | Then don't say it |
| "Leverage" (outside tech context) | "Use" |
| "Utilize" | "Use" |
| "Facilitate" | "Help" / "make easier" |
| "In order to" | "To" |
| em dashes (—) | Plain hyphen with spaces ( - ) |

### Punctuation Rules
- **No em dashes** - use a plain hyphen surrounded by spaces ( - ) instead. Em dashes are the single most common AI tell.
- Contractions are encouraged - they sound human
- Avoid exclamation marks - they feel forced
- One space after a full stop, always

### Word Count Targets
- **Standard posts:** 1,400-1,800 words (6-8 min read)
- **Comprehensive guides:** 2,000-2,500 words (9-11 min read)
- **Founder/story posts:** 1,200-1,600 words (5-7 min read)

### Publishing Cadence
- **1-2 posts per month** - consistent beats frequent
- Wait at least 2-3 weeks between posts
- Pick a fixed publish day and stick to it (e.g. every other Tuesday)
- Never backdate posts to fake a publishing history
- Don't publish a burst then go quiet - Google treats inconsistency as a negative signal
- Use `TOPIC_BACKLOG.md` - start with P0 topics (highest search volume, lowest competition)

### Linking Strategy
- Every post links to at least 2 other blog posts (internal)
- Every post links to at least 1 authoritative external source
- Blog index updated with newest post at top
- Related Articles updated across existing posts when new content is published

---

## Publishing Checklist

1. Write content using `/content-creator`
2. Generate CTA options using `/content-creator`
3. Build HTML from template (copy existing post, modify)
4. Calculate reading time (238 WPM)
5. Add all 3 JSON-LD schemas
6. Add bottom disclaimer only (glass-panel "Important:" section)
7. Add Related Articles section
8. Audit with `/senior-ux-designer` for visual/accessibility
9. Run SEO checklist above
10. Add to blog index (newest first)
11. Update Related Articles on 2-3 existing posts to link to new post
12. Generate social posts with `/social-content`
13. Test on localhost before deploying
