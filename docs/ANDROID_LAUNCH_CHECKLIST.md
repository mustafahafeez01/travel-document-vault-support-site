# Android Launch Checklist

**Status:** 🟡 Pending (Coming Early 2026)
**Last Updated:** February 25, 2026

This document outlines the exact steps needed to update the support site when the Android app launches on Google Play.

---

## 🎯 Quick Launch Command

When Android is live, simply run this command with Claude Code:

```
Android app is live on Google Play:
https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault

Please update all pages to replace "Coming Early 2026" status indicators with active Google Play badges. Enable all mobile menu buttons and update the FAQ.
```

**That's it!** Claude will automatically handle all the changes below.

---

## 📋 What Gets Updated

### Files Modified (7 total)

| File | Changes | Locations |
|------|---------|-----------|
| `index.html` | Desktop hero + footer CTA + mobile hero | 3 |
| `features/index.html` | Footer CTA + mobile menu | 2 |
| `blog/index.html` | Footer CTA + mobile menu | 2 |
| `faq/index.html` | Mobile menu + FAQ question | 2 |
| `privacy-policy/index.html` | Mobile menu only | 1 |
| `terms/index.html` | Mobile menu only | 1 |

**Total locations updated:** 11

---

## 🔄 Change Details

### 1. Desktop/Footer Android Status Indicator → Google Play Badge

**Current (Status Indicator):**
```html
<!-- Android Coming Soon (Status Indicator) -->
<div class="inline-flex items-center gap-3 h-[56px]">
  <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7 text-emerald-400/80 flex-shrink-0" viewBox="0 0 24 24" fill="currentColor">
    <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/>
  </svg>
  <div class="flex flex-col justify-center gap-0.5">
    <span class="text-[11px] font-medium text-slate-400 uppercase tracking-wide leading-tight">Coming Early 2026</span>
    <span class="text-[15px] font-semibold text-slate-100 leading-tight">Android</span>
  </div>
</div>
```

**New (Google Play Badge):**
```html
<!-- Google Play Badge -->
<a href="https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault" target="_blank" rel="noopener noreferrer" onclick="gtag('event', 'download_click', {'event_category': 'conversion', 'event_label': 'ANALYTICS_LABEL_HERE'});" class="group relative inline-flex items-center transition-transform active:scale-95">
  <div class="absolute -inset-1 bg-gradient-to-r from-brand-blue to-blue-600 rounded-lg blur opacity-25 group-hover:opacity-50 transition duration-200"></div>
  <img loading="lazy" src="assets/images/google-play-badge.svg" alt="Get it on Google Play" class="relative h-[56px] w-auto" width="135" height="40" />
</a>
```

**Analytics Labels:**
- Desktop hero: `desktop_hero_googleplay`
- Desktop footer: `final_cta_googleplay`
- Features page: `features_bottom_cta_googleplay`
- Blog page: `blog_bottom_cta_googleplay`

---

### 2. Mobile Hero Android Status → Button

**Current (Status Indicator):**
```html
<div class="flex items-center justify-center gap-3 py-2">
  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-emerald-400/80 flex-shrink-0" viewBox="0 0 24 24" fill="currentColor">
    <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/>
  </svg>
  <div class="flex flex-col gap-0.5">
    <span class="text-[10px] font-medium text-slate-400 uppercase tracking-wide leading-tight">Coming Early 2026</span>
    <span class="text-[14px] font-semibold text-slate-100 leading-tight">Android</span>
  </div>
</div>
```

**New (CTA Button):**
```html
<a href="https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault" target="_blank" rel="noopener noreferrer" onclick="gtag('event', 'download_click', {'event_category': 'conversion', 'event_label': 'mobile_hero_googleplay'});" class="flex items-center justify-center gap-2 py-3 rounded-xl bg-gradient-to-r from-brand-gold to-yellow-500 text-brand-blue font-bold text-sm shadow-[0_4px_20px_rgba(255,176,0,0.3)] hover:shadow-[0_4px_25px_rgba(255,176,0,0.4)] transition-all active:scale-95 w-full">
  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="currentColor">
    <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/>
  </svg>
  Google Play
</a>
```

---

### 3. Mobile Menu Buttons (All Pages)

**Current (Disabled):**
```html
<a href="#android-coming-soon" aria-disabled="true" onclick="return false;" class="flex items-center justify-center gap-3 px-6 py-4 rounded-xl bg-brand-gold text-brand-blue font-bold text-lg hover:bg-brand-goldHover transition-colors w-full shadow-lg cursor-not-allowed opacity-80">
  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor">
    <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/>
  </svg>
  Android Coming Soon
</a>
```

**New (Active):**
```html
<a href="https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault" target="_blank" rel="noopener noreferrer" onclick="gtag('event', 'download_click', {'event_category': 'conversion', 'event_label': 'mobile_menu_googleplay'});" class="flex items-center justify-center gap-3 px-6 py-4 rounded-xl bg-brand-gold text-brand-blue font-bold text-lg hover:bg-brand-goldHover transition-colors w-full shadow-lg">
  <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor">
    <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12.85L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,11.15L6.05,2.66Z"/>
  </svg>
  Download on Google Play
</a>
```

**Key Changes:**
- ✅ Remove `aria-disabled="true"`
- ✅ Remove `onclick="return false;"`
- ✅ Remove `cursor-not-allowed opacity-80` classes
- ✅ Change href to Play Store URL
- ✅ Add analytics tracking
- ✅ Update button text

---

### 4. FAQ Page Update

**File:** `faq/index.html`

**Find this question:**
```html
<span class="font-semibold text-white">When will the Android version be available?</span>
```

**Update answer from:**
```html
<p><strong class="text-white">The Android version is coming early 2026.</strong> We're currently in closed testing to ensure the same privacy-first, on-device storage experience works perfectly on Android devices.</p>
```

**To:**
```html
<p><strong class="text-white">Yes! The Android version is now available on Google Play.</strong> It has full feature parity with iOS, including encrypted on-device storage, OCR scanning, expiry reminders, and all Pro features.</p>
<p class="mt-3"><a href="https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault" target="_blank" rel="noopener noreferrer" class="text-blue-300 hover:text-white underline">Download on Google Play →</a></p>
```

**Also update the question itself:**
```html
<span class="font-semibold text-white">Is the Android version available?</span>
```

---

## 📊 Required Information

Before launching, you need:

### 1. Google Play URL
**Format:** `https://play.google.com/store/apps/details?id=YOUR_PACKAGE_ID`

**Expected Package ID:** `com.mustafahafeez.traveldocumentvault`

**Full URL:**
```
https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault
```

### 2. Google Play Badge Asset
**Location:** `/Users/mustafahafeez/Github/support-site/assets/images/google-play-badge.svg`

**Status:** ✅ Already exists (verified)

**Download Source (if needed):** https://play.google.com/intl/en_us/badges/

---

## 🧪 Testing Checklist

After making changes, verify:

- [ ] All Google Play badges link to correct URL
- [ ] All mobile menu buttons are active (not disabled)
- [ ] Analytics tracking works (check gtag events)
- [ ] Gap-8 spacing looks good between App Store and Google Play badges
- [ ] Mobile hero buttons work on small screens
- [ ] FAQ answer updated correctly
- [ ] No broken images (Google Play badge loads)
- [ ] Links open in new tab (`target="_blank"`)
- [ ] Test on actual mobile devices
- [ ] Test on desktop browsers

---

## 📈 Analytics Events to Monitor

After launch, track these Google Analytics events:

| Event Label | Location | Expected Volume |
|-------------|----------|-----------------|
| `desktop_hero_googleplay` | Homepage desktop hero | High |
| `final_cta_googleplay` | Homepage footer CTA | Medium |
| `mobile_hero_googleplay` | Homepage mobile hero | High |
| `mobile_menu_googleplay` | Mobile menu (all pages) | Low |
| `features_bottom_cta_googleplay` | Features page CTA | Medium |
| `blog_bottom_cta_googleplay` | Blog page CTA | Low |

Compare with iOS download events to track platform split.

---

## ⏱️ Estimated Time to Complete

**Manual:** ~30-45 minutes
**With Claude Code:** ~5 minutes

---

## 🔗 Related Documentation

- Original plan: `/Users/mustafahafeez/.claude/plans/shimmying-enchanting-tome.md`
- Design system documentation: (if exists)
- Google Play brand guidelines: https://play.google.com/intl/en_us/badges/

---

## 📝 Notes

### Why "Coming Early 2026" vs. Specific Date

We chose "Coming Early 2026" instead of a specific date (e.g., "March 2026") to:
- ✅ Set clear expectations without over-promising
- ✅ Give flexibility for closed testing completion
- ✅ Keep users engaged without creating false urgency
- ✅ Avoid commitment to specific launch date

### Design Decisions

**Current Status Indicator Design:**
- Clean, non-clickable indicator (not a button)
- Emerald icon (Android brand color)
- Typography hierarchy: "Android" (15px primary) + "Coming Early 2026" (11px secondary)
- Gap-8 (32px) spacing from App Store badge
- WCAG AAA contrast compliance (8.9:1)

**Launch Design:**
- Official Google Play badge (matches App Store badge style)
- Same gap-8 spacing maintained
- Same analytics structure as iOS downloads
- Mobile buttons become active CTAs

---

## 🚀 Launch Day Command

Copy this command when ready to launch:

```
Android app is live on Google Play:
https://play.google.com/store/apps/details?id=com.mustafahafeez.traveldocumentvault

Please update all pages to replace "Coming Early 2026" status indicators with active Google Play badges. Enable all mobile menu buttons and update the FAQ.

Files to update:
- index.html (3 locations)
- features/index.html (2 locations)
- blog/index.html (2 locations)
- faq/index.html (2 locations)
- privacy-policy/index.html (1 location)
- terms/index.html (1 location)

Verify:
- All badges link to Play Store
- Mobile menu buttons are active
- FAQ updated
- Analytics tracking added
- Gap-8 spacing preserved
```

**Status after completion:** 🟢 Live

---

## 📞 Support

If you encounter issues during launch:
1. Check this document for reference
2. Review the original plan file
3. Verify Google Play URL is correct
4. Test on multiple devices before going live

---

**Document Version:** 1.0
**Created:** February 25, 2026
**Author:** Claude Code (via senior-ux-designer skill)
