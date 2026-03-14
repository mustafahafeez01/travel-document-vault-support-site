# Blog — Docs & Reference

Central reference for the Travel Document Vault blog. For the full HTML spec used when creating posts, see [`blog/BLOG_POST_SYSTEM_PROMPT.md`](../../blog/BLOG_POST_SYSTEM_PROMPT.md).

---

## Published Posts

| # | Slug | Title | Published | Tag | Read time |
|---|------|-------|-----------|-----|-----------|
| 1 | `passport-expiry-6-month-rule` | The 6-Month Passport Rule: Which Countries Enforce It and How to Never Get Caught Out | Feb 1, 2026 | `tag-passport` | 8 min |
| 2 | `how-to-organise-family-travel-documents` | How to Organise Family Travel Documents (Before Your Next Trip) | Feb 5, 2026 | `tag-organisation` | 7 min |
| 3 | `how-long-does-passport-renewal-take` | How Long Does Passport Renewal Take? (US, UK, Australia, Canada) | Feb 10, 2026 | `tag-renewal` | 7 min |
| 4 | `is-it-safe-to-store-passport-in-google-photos` | Is It Safe to Store Your Passport in Google Photos? What You Need to Know | Feb 15, 2026 | `tag-privacy` | 7 min |
| 5 | `best-passport-organizer-app` | Best Passport Organizer App in 2026: A Practical Guide for Families | Mar 4, 2026 | `tag-passport` | 8 min |
| 6 | `travel-document-checklist` | International Travel Document Checklist for Every Trip | Mar 4, 2026 | `tag-organisation` | 9 min |
| 7 | `passport-expired-what-to-do` | Passport Expired? Here's Exactly What to Do (Step by Step) | Mar 9, 2026 | `tag-passport` | 9 min |
| 8 | `lost-passport-abroad` | Lost Your Passport Abroad? Do These 7 Things Immediately | Mar 11, 2026 | `tag-emergency` | 7 min |
| 9 | `why-i-built-travel-document-vault` | Why I Built Travel Document Vault: For the Parent Who Remembers Everything | Feb 1, 2026 | `tag-story` | 7 min |
| 10 | `travel-while-passport-renewal-pending` | Can You Travel While Your Passport Is Being Renewed? | Mar 14, 2026 | `tag-renewal` | 7 min |

---

## Drafts Pipeline

Managed in [`blog/_drafts/README.md`](../../blog/_drafts/README.md). Publishing schedule and post cards are there.

| Slug | Status | Target date |
|------|--------|-------------|
| `what-documents-to-carry-when-travelling-internationally` | ✍️ Draft ready | Mar 18, 2026 |
| `visa-expiry-tracker-app` | ✍️ Draft ready | Mar 18, 2026 |
| `digital-passport-copy-valid` | ✍️ Draft ready | Mar 25, 2026 |
| `safest-way-to-store-passport-digitally` | 📝 Not yet written | Apr 8, 2026 |
| `child-travel-consent-letter` | 📝 Not yet written | Apr 15, 2026 |
| `visa-vs-passport` | 📝 Not yet written | Apr 22, 2026 |
| `passport-photo-at-home` | 📝 Not yet written | Apr 29, 2026 |
| `travel-insurance-documents` | 📝 Not yet written | May 6, 2026 |

---

## Topic Backlog (Posts #16–#27)

| # | Slug | Primary keyword | Pillar |
|---|------|----------------|--------|
| 16 | `schengen-90-180-day-rule-calculator` | schengen 90/180 day rule | Visas |
| 17 | `visa-requirements-popular-destinations` | visa requirements by country | Visas |
| 18 | `uk-children-passports-european-travel-post-brexit` | children passport requirements brexit | Family |
| 19 | `passport-validity-requirements-by-country` | passport validity requirements | Passport rules |
| 20 | `renew-passport-before-expiry` | renew passport before expiry | Renewal |
| 21 | `travelling-child-without-both-parents-documentation` | travelling with one parent documentation | Family |
| 22 | `emergency-passport-vs-standard-passport` | emergency passport vs standard | Renewal |
| 23 | `passport-name-change-after-marriage` | passport name change after marriage | Renewal |
| 24 | `eta-vs-visa-difference` | eTA vs visa difference | Visas |
| 25 | `store-travel-documents-securely-at-home` | store travel documents at home | Privacy |
| 26 | `travelling-temporary-passport` | travelling with temporary passport | Passport rules |
| 27 | `visa-extension-abroad-rules` | visa extension abroad rules | Visas |

Full briefs with angles and sources are in [`blog/_drafts/CONTENT_IDEAS.md`](../../blog/_drafts/CONTENT_IDEAS.md).

---

## Writing Rules (quick reference)

The complete spec is in [`blog/BLOG_POST_SYSTEM_PROMPT.md`](../../blog/BLOG_POST_SYSTEM_PROMPT.md). Non-negotiable rules:

- **British English:** traveller, organised, colour, licence, programme, recognise
- **No em dashes** — never `--` or `—`. Use a comma, full stop, or rewrite
- **No exclamation marks** in titles or body copy
- **No year references** in body text — use "currently" + official source link
- **No AI slop phrases:** "in today's world", "seamlessly", "leverage", "robust", "dive into", "invaluable", "meticulous", "empower"
- **No made-up stats** — every specific number needs an official source with an inline link
- **No buttons in mid-article CTAs** — inline text link only
- **Active voice** throughout

---

## Canonical HTML reference

`blog/passport-expired-what-to-do/index.html` is the canonical reference file. Every new post must structurally match it. Key checks before publishing:

- `<!doctype html>` lowercase
- `charset="utf-8"` lowercase
- All 3 JSON-LD schemas in `<head>` (not body)
- `og:image` → `social-preview.png` (not any other filename)
- CSS path → `../../dist/output.css`
- Asset paths → `../../assets/` (two levels up, never three)
- Nav is `fixed`, not sticky
- `<article class="max-w-[720px] mx-auto relative z-10">`
- Takeaways: `<h2>Key Takeaways</h2>` (h2, not h3)
- FAQ items: `<h3>` (not h4)
- Mid-article CTA: inline text link, no button
- Bottom CTA: App Store badge + Google Play badge (no "Coming Soon" block)
- Footer: `pb-24 md:pb-10`

---

## Official Sources

| Country | URL |
|---------|-----|
| US passport | https://travel.state.gov |
| UK passport | https://www.gov.uk/apply-renew-passport |
| Australia passport | https://www.passports.gov.au |
| Canada passport | https://www.canada.ca/en/immigration-refugees-citizenship/services/canadian-passports.html |
| NZ passport | https://www.passports.govt.nz |
| Ireland passport | https://www.ireland.ie/en/dfa/passports/ |
| UK travel advice | https://www.gov.uk/foreign-travel-advice |
| US travel advice | https://travel.state.gov |
| Australia travel advice | https://www.smartraveller.gov.au |
| Entry requirements (IATA Timatic) | https://www.iatatravelcentre.com |
