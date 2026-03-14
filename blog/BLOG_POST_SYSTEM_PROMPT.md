# Blog Post System Prompt — Travel Document Vault

Use this as the master reference when creating any new blog post HTML file.

**Canonical reference file:** `blog/passport-expired-what-to-do/index.html`

---

## Output

A single complete `index.html` file saved at:
`blog/[slug]/index.html`

Save here — this is the draft. Publishing to `blog/index.html` is handled by the publish workflow described in `blog/_drafts/README.md`.

---

## Exact HTML Structure

### `<head>` — required elements in this order

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#003A87">

  <!-- SEO metadata -->
  <title>[60 chars max, primary keyword near front]</title>
  <meta name="description" content="[155 chars max, keyword + benefit, no year]">
  <link rel="canonical" href="https://traveldocumentvault.com/blog/[slug]/">

  <!-- Open Graph -->
  <meta property="og:title" content="[same as title]">
  <meta property="og:description" content="[same as meta description]">
  <meta property="og:image" content="https://traveldocumentvault.com/assets/images/social-preview.png">
  <meta property="og:url" content="https://traveldocumentvault.com/blog/[slug]/">
  <meta property="og:type" content="article">
  <meta property="og:image:width" content="1200">
  <meta property="og:image:height" content="630">

  <!-- Twitter -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="[same as title]">
  <meta name="twitter:description" content="[same as meta description]">
  <meta name="twitter:image" content="https://traveldocumentvault.com/assets/images/social-preview.png">

  <link rel="icon" type="image/svg+xml" href="/assets/images/app_icon.svg">
  <link rel="apple-touch-icon" href="/assets/images/app_icon.svg">

  <meta name="robots" content="index, follow">
  <link rel="sitemap" type="application/xml" title="Sitemap" href="/sitemap.xml">
```

### JSON-LD schemas (3 required, all in `<head>`)

1. **BlogPosting** — `author` is `Organization` (Travel Document Vault) for informational posts, `Person` (Mustafa Hafeez) for founder/personal posts. Include `mainEntityOfPage`.
2. **FAQPage** — 4–6 questions using "People Also Ask" phrasing, plain text answers (no HTML tags inside).
3. **BreadcrumbList** — 3 levels: Home > Blog > [Short title]

All three `<script type="application/ld+json">` blocks go in the `<head>`, before the font links.

Use `"datePublished"` and `"dateModified"` in `YYYY-MM-DD` format. No year references in descriptions.

### CSS block (identical across all posts — copy exactly)

```html
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="preload" href="../../dist/output.css" as="style">
  <link rel="stylesheet" href="../../dist/output.css">
  <link rel="preload" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=Caveat:wght@400;500;600;700&display=optional" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=Caveat:wght@400;500;600;700&display=optional"></noscript>
  <style>
    html { scroll-behavior: smooth; }
    .glass-panel { background: rgba(17, 25, 40, 0.6); backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px); border: 1px solid rgba(255, 255, 255, 0.08); }
    .prose p { margin-bottom: 1.5em; line-height: 1.8; }
    .prose strong { color: #FFB000; font-weight: 600; }
    .nav-link { position: relative; }
    .nav-link::after { content: ''; position: absolute; bottom: -2px; left: 0; width: 0; height: 2px; background: #FFB000; transition: width 0.3s ease; }
    .nav-link:hover::after { width: 100%; }
    .nav-link-active { color: #FFFFFF !important; }
    .nav-link-active::after { width: 100%; }
    .takeaways-box { background: rgba(255, 176, 0, 0.07); border: 1px solid rgba(255, 176, 0, 0.2); border-radius: 12px; padding: 1.25rem 1.25rem; margin-bottom: 2.5rem; }
    @media (min-width: 640px) { .takeaways-box { padding: 1.5rem 2rem; } }
    .takeaways-box h2 { color: #FFB000; font-size: 0.85rem; font-weight: 700; letter-spacing: 0.08em; text-transform: uppercase; margin-bottom: 1rem; }
    .takeaways-box ul { list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.6rem; }
    .takeaways-box li { display: block; position: relative; padding-left: 1.4rem; color: rgba(219, 234, 254, 0.85); font-size: 0.9rem; line-height: 1.55; }
    .takeaways-box li strong { font-weight: 600; }
    .takeaways-box li::before { content: '→'; color: #FFB000; position: absolute; left: 0; top: 0; line-height: 1.55; }
    .faq-section { margin-top: 3rem; border-top: 1px solid rgba(255,255,255,0.08); padding-top: 2rem; }
    .faq-item { margin-bottom: 1.5rem; }
    .faq-item h3 { color: #ffffff; font-size: 1rem; font-weight: 600; margin-bottom: 0.5rem; }
    .faq-item p { color: rgba(219, 234, 254, 0.75); font-size: 0.95rem; line-height: 1.7; margin-bottom: 0; }
    .post-card { background: rgba(17, 25, 40, 0.6); backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px); border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 16px; transition: border-color 0.2s ease, transform 0.2s ease; text-decoration: none; display: block; }
    .post-card:hover { border-color: rgba(255, 176, 0, 0.3); transform: translateY(-2px); }
    .tag-pill { display: inline-flex; align-items: center; gap: 0.4rem; padding: 0.3rem 0.8rem; border-radius: 999px; font-size: 0.75rem; font-weight: 600; letter-spacing: 0.04em; text-transform: uppercase; }
    .tag-passport { background: rgba(59,130,246,0.15); color: #93c5fd; border: 1px solid rgba(59,130,246,0.2); }
    .tag-organisation { background: rgba(52,211,153,0.12); color: #6ee7b7; border: 1px solid rgba(52,211,153,0.2); }
    .tag-renewal { background: rgba(251,191,36,0.12); color: #fcd34d; border: 1px solid rgba(251,191,36,0.2); }
    .tag-privacy { background: rgba(167,139,250,0.12); color: #c4b5fd; border: 1px solid rgba(167,139,250,0.2); }
    .tag-story { background: rgba(255,176,0,0.1); color: #FFB000; border: 1px solid rgba(255,176,0,0.2); }
    .tag-emergency { background: rgba(239,68,68,0.12); color: #fca5a5; border: 1px solid rgba(239,68,68,0.2); }
    .scroll-fade-in { opacity: 0; transform: translateY(30px); transition: opacity 0.6s ease-out, transform 0.6s ease-out; }
    .scroll-fade-in.visible { opacity: 1; transform: translateY(0); }
  </style>
</head>
```

**Style block rules:**
- This block is the complete and only `<style>` block. No additional component CSS anywhere.
- Do not add `.cta-button`, `.article-header`, `.breadcrumb`, `.nav-container`, `.footer-links`, or any other custom classes.
- Tag classes in use: `tag-passport`, `tag-renewal`, `tag-organisation`, `tag-privacy`, `tag-story`, `tag-emergency`. Add new ones to this block if genuinely needed.

---

### `<body>` tag (exact)

```html
<body class="bg-gradient-to-b from-[#003A87] to-[#0A192F] font-sans antialiased text-slate-200 min-h-screen selection:bg-brand-gold selection:text-white">
<a href="#main" class="skip-link sr-only">Skip to main content</a>
```

---

### Navigation (exact — copy from reference)

```html
<nav class="fixed top-0 left-0 right-0 z-[100] glass-panel border-b border-white/5 transition-all duration-300">
  <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-16">
      <a href="../../" class="flex items-center gap-3 group">
        <img loading="lazy" src="../../assets/images/app_icon.svg" alt="Travel Document Vault" class="w-8 h-8 group-hover:scale-110 transition-transform duration-300" width="32" height="32" />
        <span class="font-bold text-white hidden sm:block tracking-tight group-hover:text-blue-100 transition-colors">Travel Document Vault</span>
      </a>
      <button id="mobile-menu-button" type="button" class="md:hidden p-2 text-slate-200 hover:text-white transition-colors" aria-controls="mobile-menu" aria-expanded="false" aria-label="Toggle menu">
        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg>
      </button>
      <div class="hidden md:flex items-center gap-6 text-sm font-medium">
        <a href="../../" class="nav-link text-slate-50 hover:text-white transition-colors">Home</a>
        <a href="../../features/" class="nav-link text-slate-50 hover:text-white transition-colors">Features</a>
        <a href="../../why-us/" class="nav-link text-slate-50 hover:text-white transition-colors">Why Us</a>
        <a href="../" class="nav-link nav-link-active text-slate-50 hover:text-white transition-colors" aria-current="page">Blog</a>
        <a href="../why-i-built-travel-document-vault/" class="nav-link text-slate-50 hover:text-white transition-colors">Why I Built This</a>
        <a href="../../#pricing" class="nav-link text-slate-50 hover:text-white transition-colors">Pricing</a>
        <a href="../../faq/" class="nav-link text-slate-50 hover:text-white transition-colors">FAQ</a>
        <a href="../../privacy-policy/" class="nav-link text-slate-50 hover:text-white transition-colors">Privacy</a>
      </div>
    </div>
  </div>
</nav>
<div id="mobile-menu" class="hidden md:hidden fixed top-16 left-0 right-0 bottom-0 bg-[#0A192F] z-[90] border-t border-white/10 p-6 space-y-6 overflow-y-auto transition-opacity transition-transform duration-300 ease-in-out opacity-0 -translate-y-4">
  <div class="space-y-4">
    <a href="../../" class="block text-lg font-medium text-slate-200 hover:text-white pl-4 py-1 hover:border-l-2 hover:border-brand-gold transition-all">Home</a>
    <a href="../../features/" class="block text-lg font-medium text-slate-200 hover:text-white pl-4 py-1 hover:border-l-2 hover:border-brand-gold transition-all">Features</a>
    <a href="../../why-us/" class="block text-lg font-medium text-slate-200 hover:text-white pl-4 py-1 hover:border-l-2 hover:border-brand-gold transition-all">Why Us</a>
    <a href="../" class="block text-lg font-medium text-white border-l-2 border-brand-gold pl-4 py-1" aria-current="page">Blog</a>
    <a href="../why-i-built-travel-document-vault/" class="block text-lg font-medium text-slate-200 hover:text-white pl-4 py-1 hover:border-l-2 hover:border-brand-gold transition-all">Why I Built This</a>
    <a href="../../#pricing" class="block text-lg font-medium text-slate-200 hover:text-white pl-4 py-1 hover:border-l-2 hover:border-brand-gold transition-all">Pricing</a>
    <a href="../../faq/" class="block text-lg font-medium text-slate-200 hover:text-white pl-4 py-1 hover:border-l-2 hover:border-brand-gold transition-all">FAQ</a>
  </div>
  <div class="pt-4 border-t border-white/10 space-y-3">
    <a href="https://apps.apple.com/app/travel-document-vault/id6757014877" target="_blank" rel="noopener noreferrer" onclick="gtag('event', 'download_click', {'event_category': 'conversion', 'event_label': 'mobile_menu_appstore'});" class="flex items-center justify-center gap-3 px-6 py-4 rounded-xl bg-brand-gold text-brand-blue font-bold text-lg hover:bg-brand-goldHover transition-colors w-full shadow-lg">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor"><path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/></svg>
      Download on App Store
    </a>
  </div>
</div>
```

**Nav rules:**
- Nav is `fixed`, not `sticky`. `z-[100]`.
- Blog link always gets `nav-link-active` and `aria-current="page"` on blog posts — not the specific article.
- All hrefs use `../../` prefix (two levels up from `blog/[slug]/`).
- Asset paths use `../../assets/` (two levels up).

---

### `<main>` and `<article>` (exact)

```html
<main id="main" class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 pt-24 sm:pt-32">
  <article class="max-w-[720px] mx-auto relative z-10">
```

---

### Article structure (inside `<article>`)

```html
<!-- Breadcrumb -->
<nav aria-label="Breadcrumb" class="mb-8 text-sm text-blue-200/50">
  <ol class="flex items-center gap-2">
    <li><a href="../../" class="hover:text-white transition-colors">Home</a></li>
    <li aria-hidden="true">›</li>
    <li><a href="../" class="hover:text-white transition-colors">Blog</a></li>
    <li aria-hidden="true">›</li>
    <li class="text-blue-200/80" aria-current="page">[Short title, 3–5 words]</li>
  </ol>
</nav>

<!-- Header -->
<header class="mb-10 animate-fade-in-down">
  <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full glass-panel text-blue-200 text-sm font-medium tracking-wide shadow-lg mb-6">
    <span class="w-2 h-2 rounded-full bg-brand-gold shadow-[0_0_10px_rgba(255,176,0,0.5)]" aria-hidden="true"></span>
    [Category label — e.g. "Passport Renewal"]
  </div>
  <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold text-white mb-6 leading-[1.15] tracking-tight">
    [Full post title]
  </h1>
  <div class="flex items-center gap-3">
    <div class="text-left">
      <p class="text-white text-sm font-semibold mb-0.5">Travel Document Vault</p>
      <div class="flex items-center gap-2 text-blue-200/50 text-xs">
        <time datetime="YYYY-MM-DD">[Month DD, YYYY]</time>
        <span aria-hidden="true">·</span>
        <span>[N] min read</span>
      </div>
    </div>
  </div>
</header>

<!-- Glass panel containing all content -->
<div class="glass-panel rounded-2xl shadow-glass p-6 sm:p-12 animate-fade-in-up opacity-0">

  <!-- Takeaways box — always first inside glass panel -->
  <div class="takeaways-box">
    <h2>Key Takeaways</h2>
    <ul>
      <li>[Takeaway — use <strong> for key terms]</li>
    </ul>
  </div>

  <!-- Prose content -->
  <div class="prose md:prose-lg prose-invert prose-headings:font-bold prose-headings:text-white prose-p:text-blue-100/80 prose-p:leading-relaxed prose-strong:text-brand-gold prose-a:text-brand-gold hover:prose-a:text-white prose-blockquote:border-brand-gold prose-blockquote:bg-blue-500/5 prose-blockquote:py-2 prose-blockquote:px-6 prose-blockquote:rounded-r-lg prose-li:text-blue-100/80">

    [Article body]
    [H2s: class="text-2xl text-white mt-12 mb-6"]
    [H3s: class="text-xl text-white mt-8 mb-4"]

    <!-- Mid-article CTA nudge — inline text link, NO button -->
    <div style="background: rgba(255,176,0,0.06); border: 1px solid rgba(255,176,0,0.15); border-radius: 10px; padding: 1rem 1.25rem; margin: 2rem 0;">
      <p style="margin: 0; font-size: 0.9rem; color: rgba(219,234,254,0.85); line-height: 1.6;">
        <strong style="color: #FFB000;">[Specific benefit statement].</strong> <a href="https://apps.apple.com/app/travel-document-vault/id6757014877" target="_blank" rel="noopener noreferrer" style="color: #FFB000;">Free on the App Store.</a>
      </p>
    </div>

    <!-- FAQ section -->
    <div class="faq-section">
      <h2 class="text-2xl text-white mb-6">Frequently Asked Questions</h2>
      <div class="faq-item">
        <h3>[Question — must match a question in the FAQPage JSON-LD]</h3>
        <p>[Answer]</p>
      </div>
    </div>

  </div><!-- end .prose -->
</div><!-- end glass-panel -->

<!-- Related Articles — outside glass panel, inside <article> -->
<aside class="mt-12" aria-label="Related articles">
  <h2 class="text-xs font-bold text-blue-200/40 uppercase tracking-widest mb-4">Related Articles</h2>
  <div class="flex flex-col gap-3">
    <a href="../[slug]/" class="post-card" style="padding: 0.75rem 1rem;">
      <div class="flex items-center gap-2 mb-3">
        <span class="tag-pill tag-[category]">[Category]</span>
        <span class="text-blue-200/40 text-xs">[N] min read · [Date]</span>
      </div>
      <p class="text-white font-semibold text-sm leading-snug">[Title]</p>
    </a>
  </div>
</aside>

  </article><!-- close article -->

  <!-- Disclaimer — outside <article>, inside <main> -->
  <section class="px-4 mb-8 mt-12">
    <div class="glass-panel rounded-2xl p-6 sm:p-8 text-center max-w-3xl mx-auto">
      <p class="text-slate-50 text-sm leading-relaxed">
        <strong class="text-slate-200">Disclaimer:</strong> [Post-specific disclaimer]. The author and publisher accept no liability for decisions made based on this content.
      </p>
    </div>
  </section>

  <!-- Bottom CTA — outside <article>, inside <main> -->
  <section class="scroll-fade-in text-center space-y-6 pt-24 pb-24">
    <h2 class="text-3xl sm:text-4xl font-bold text-white">[Unique CTA heading — see table below]</h2>
    <p class="text-blue-200/70 text-lg max-w-xl mx-auto">[Unique subtitle — see table below]</p>
    <div class="flex flex-col sm:flex-row items-center justify-center gap-8">
      <a href="https://apps.apple.com/app/travel-document-vault/id6757014877" target="_blank" rel="noopener noreferrer" onclick="gtag('event', 'download_click', {'event_category': 'conversion', 'event_label': '[slug]_bottom_cta_appstore'});" class="group relative inline-flex items-center transition-transform active:scale-95">
        <img loading="lazy" src="../../assets/images/app-store-badge-black.svg" alt="Download on the App Store" class="relative h-[56px] w-auto" width="120" height="40" />
      </a>
      <a href="https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault" target="_blank" rel="noopener noreferrer" class="group relative inline-flex items-center transition-transform active:scale-95">
        <img loading="lazy" src="../../assets/images/google-play-badge.svg" alt="Get it on Google Play" class="relative h-[56px] w-auto" width="135" height="40" />
      </a>
    </div>
  </section>

  <!-- Footer — inside <main> -->
  <footer class="text-center pt-20 pb-24 md:pb-10 space-y-4">
    <div class="flex flex-wrap items-center justify-center gap-x-6 gap-y-2 text-sm font-medium">
      <a href="../../features/" class="text-slate-50 hover:text-white transition-colors duration-200">Features</a>
      <span class="text-blue-200/20 hidden sm:inline">·</span>
      <a href="../../faq/" class="text-slate-50 hover:text-white transition-colors duration-200">FAQ</a>
      <span class="text-blue-200/20 hidden sm:inline">·</span>
      <a href="../why-i-built-travel-document-vault/" class="text-slate-50 hover:text-white transition-colors duration-200">Why We Built This</a>
      <span class="text-blue-200/20 hidden sm:inline">·</span>
      <a href="../../accessibility/" class="text-slate-50 hover:text-white transition-colors duration-200">Accessibility</a>
      <span class="text-blue-200/20 hidden sm:inline">·</span>
      <a href="../../privacy-policy/" class="text-slate-50 hover:text-white transition-colors duration-200">Privacy Policy</a>
      <span class="text-blue-200/20 hidden sm:inline">·</span>
      <a href="../../terms/" class="text-slate-50 hover:text-white transition-colors duration-200">Terms of Service</a>
      <span class="text-blue-200/20 hidden sm:inline">·</span>
      <a href="../../pricing-policy/" class="text-slate-50 hover:text-white transition-colors duration-200">Pricing Policy</a>
    </div>
    <div class="text-sm">
      <a href="mailto:support@traveldocumentvault.com" class="text-slate-50 hover:text-white transition-colors duration-200">support&#64;traveldocumentvault&#46;com</a>
    </div>
    <p class="text-slate-50 text-xs">© Mustafa Hafeez. All rights reserved.</p>
  </footer>
</main>

  <!-- Scripts — at end of <body> -->
  <script src="../../assets/js/cookie-consent.js" defer></script>
  <script src="../../assets/js/mobile-menu.js" defer></script>
  <script>
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
  </script>
</body>
</html>
```

---

## Content and Writing Rules

- **British English** throughout: traveller, organised, colour, licence, programme, recognise.
- **No em dashes** anywhere — never use `--` or `—`. Use a comma, a full stop, or rewrite the sentence.
- **No exclamation marks** in titles or body copy.
- **No year references** in body text (e.g. never "in 2026"). Use "currently" + an inline link to the official source.
- **No made-up stats.** Every specific number must come from an official source (gov.uk, travel.state.gov, passports.gov.au, canada.ca, etc.) and have an inline link.
- **No AI slop phrases:** "in today's world", "seamlessly", "leverage", "robust", "dive into", "invaluable", "meticulous", "empower", "it is worth noting", "furthermore", "delve into".
- **Active voice** throughout.
- **Mid-article CTA:** inline `<div>` nudge with a text link — never a `<button>` or `.cta-button` class.
- **Word count:** 1,400–1,800 words in article body.
- **Reading time:** `ceil(word_count / 238)`. Display as "N min read".
- **Voice:** Calm, reassuring, knowledgeable. Second person ("you").
- **Structure:** Takeaways box → opening hook → H2 sections → mid-article CTA nudge → FAQ section → Related Articles → Disclaimer → Bottom CTA.

---

## Bottom CTA — unique heading and subtitle per post

| Slug | CTA h2 | Subtitle |
|------|--------|----------|
| `travel-while-passport-renewal-pending` | Know When to Renew Before It Becomes Urgent | Travel Document Vault reminds you at 6, 3, and 1 month before every passport in your household expires. No spreadsheet. No surprises. |
| `digital-passport-copy-valid` | Your Documents, Encrypted and Ready | One tap access to every document, for every person in your family. AES-256 encrypted. No cloud. |
| `safest-way-to-store-passport-digitally` | Your Passport Deserves Actual Encryption | AES-256 on your device. No cloud. No account. No risk. |
| `child-travel-consent-letter` | Every Family Document, One Secure Place | Consent letters, passports, birth certificates — all tracked, all accessible when you need them. |
| `visa-vs-passport` | One Place for Every Travel Document | Passports, visas, insurance — organised, tracked, and encrypted on your device. |
| `passport-photo-at-home` | Store Your Passport Photo Securely Too | One encrypted vault for the photo, the document, and the expiry reminder. |
| `travel-insurance-documents` | Every Document Ready When You Need It | Scan once. Access anywhere. AES-256 encrypted, stored only on your device. |
| `damaged-passport-travel` | Don't Wait for the Gate to Find Out | Track every passport's condition and expiry. Renewal reminders at 6, 3, and 1 month. |
| `dual-citizenship-travel` | Two Passports. One Organised Vault. | Store multiple passports per person with separate expiry tracking. No cloud. No account. |
| `when-to-renew-passport` | Start the Clock Before It Runs Out | Reminders at 6, 3, and 1 month before every passport expires — so you always renew with time to spare. |
| `real-id-vs-passport` | Passport Expiry Caught Before It Catches You | Automatic reminders. Every document. Every family member. |
| `check-visa-requirements` | All Your Visas and Documents, Organised | One encrypted vault for passports, visas, and every travel document your family needs. |
| `passport-name-change-marriage` | Update Done. Reminder Set. | Track your new passport expiry automatically from the moment you scan it. |
| `first-time-flying-internationally` | Your First Trip, Without the Document Stress | Everything checked, stored, and reminded — so you arrive at the airport confident. |
| `how-long-passport-valid` | Know Your Expiry Before It Knows You | Automatic expiry tracking for every passport, every person. Never caught short again. |

For any slug not listed above, write a unique CTA heading and subtitle that fits the post's specific topic and benefit angle.

---

## Tag pill reference

| Class | Colour | Use for |
|-------|--------|---------|
| `tag-passport` | Blue | Passport rules, digital copies, validity, photo |
| `tag-renewal` | Yellow/amber | Renewal timelines, expired passport, renewal pending, visa expiry |
| `tag-organisation` | Green | Family docs, checklists, insurance docs, consent letters |
| `tag-privacy` | Purple | Security, storage, iCloud vs Google Photos |
| `tag-story` | Gold | Founder story only |
| `tag-emergency` | Red | Lost passport, airport emergencies |

---

## Official Sources to Use

- **US passport:** https://travel.state.gov
- **UK passport:** https://www.gov.uk/apply-renew-passport
- **Australia passport:** https://www.passports.gov.au
- **Canada passport:** https://www.canada.ca/en/immigration-refugees-citizenship/services/canadian-passports.html
- **NZ passport:** https://www.passports.govt.nz
- **Ireland passport:** https://www.ireland.ie/en/dfa/passports/
- **Entry requirements (timatic):** https://www.iatatravelcentre.com
- **UK travel advice:** https://www.gov.uk/foreign-travel-advice
- **US travel advisories:** https://travel.state.gov
- **Australia travel advice:** https://www.smartraveller.gov.au

---

## Common mistakes to avoid

| Mistake | Correct pattern |
|---------|----------------|
| `<!DOCTYPE html>` uppercase | `<!doctype html>` lowercase |
| `charset="UTF-8"` uppercase | `charset="utf-8"` lowercase |
| JSON-LD at bottom of `<body>` | All three JSON-LD blocks in `<head>` |
| `../../../assets/` (3 levels up) | `../../assets/` (2 levels up) |
| `../../../dist/output.css` | `../../dist/output.css` |
| Custom `<style>` block with component CSS | Use the compact 30-line style block only |
| `<nav>` with `position: sticky` | `<nav class="fixed ...">` |
| `<h3>` inside `.takeaways-box` | `<h2>Key Takeaways</h2>` |
| `<h4>` inside `.faq-item` | `<h3>[Question]</h3>` |
| Button or `.cta-button` in mid-article CTA | Inline text link only |
| `og:image` pointing to a non-existent file | Always use `social-preview.png` |
| Android "Coming Soon" block in bottom CTA | Google Play badge (`google-play-badge.svg`) |
| `<main>` without `id="main"` | `<main id="main" class="...">` |
| `<article class="max-w-3xl ...">` | `<article class="max-w-[720px] mx-auto relative z-10">` |
