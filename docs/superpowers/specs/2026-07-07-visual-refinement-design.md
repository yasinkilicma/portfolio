# Visual Refinement — Portfolio Site

**Date:** 2026-07-07
**Scope:** `css/style.css`, `blog/blog.css`, font `<link>` additions in `index.html` and `blog/*.html` heads.

## Goal

Refine the existing minimal/CV-style design (white background, orange accent, single column) without changing its character. One consistent design language across the homepage and all blog pages. Light theme only, no dark mode, no content or structural changes, no JS changes.

## Section 1: Design Tokens

Applied identically in both `css/style.css` and `blog/blog.css`:

- **Font pairing:** Body stays Geist. Add `Fraunces` (Google Fonts, serif) for large headings only: `.hero-title`, `.blog-hero-title`, article `h1`. Weight 600, `font-optical-sizing: auto`.
- **Spacing scale:** Formalize existing 8px-multiple values as custom properties: `--space-2: 16px`, `--space-3: 24px`, `--space-4: 32px`, `--space-5: 40px`, `--space-6: 48px`, `--space-8: 64px`, `--space-10: 80px`. Replace hardcoded padding/margin values with tokens; visual output stays effectively identical.
- **Color tuning:**
  - `--text-muted`: `#6b7280` → `#5b6472` (slightly darker, better readability).
  - `--accent` stays `#e85d04`.
  - New `--accent-soft: #fff3ea` (hover background tint).
- **Shadow tokens:** `--shadow-sm: 0 1px 2px rgba(0,0,0,0.04)`, `--shadow-md: 0 4px 12px rgba(0,0,0,0.06)` for hover states.
- **Easing:** `--transition` updated from `all 0.2s ease` to `all 0.22s cubic-bezier(0.25, 0.6, 0.3, 1)`.

## Section 2: Homepage (index.html / style.css)

- **Hero:** Title uses Fraunces, size `clamp(2rem, 6vw, 3rem)`. Small orange accent detail under the title (short 32px underline bar, 3px tall, accent color). "→ View my projects" link: arrow shifts 4px right on hover via transform (arrow wrapped or done with pseudo-element/translate on whole link).
- **Nav:** Replace `text-decoration: underline` on hover/active with a short accent underline via `border-bottom` or pseudo-element (2px accent line). Transitions use the new easing token.
- **Project rows:** Keep row layout and dotted leaders. On hover: full row gets `--accent-soft` background tint (with small negative-margin/padding compensation so text stays aligned), tag becomes a pill (background `--accent-soft`, accent text). No card conversion, no elevation.
- **Skill tags:** Keep pill design; hover colors move to `--accent-soft` token.
- **Scroll reveal:** Keep `.reveal` mechanics; easing updated to the new cubic-bezier.

## Section 3: Blog Pages (blog/blog.css)

- Same token block applied (Fraunces headings, darker muted, spacing, easing).
- `blog/index.html` tab bar and post list get the same hover behavior as homepage project rows (accent-soft row tint, accent tab underline already exists — align easing).
- Article-internal components (callouts, code blocks, tables, timelines, cards) untouched except where they inherit changed tokens.
- No per-article HTML edits. Only the Fraunces `<link>` tag needs adding to HTML heads: `index.html`, `blog/index.html`, and all `blog/*.html` articles (mechanical one-line addition next to the existing Geist link).

## Out of Scope

- Dark mode
- Content/copy changes
- JS changes
- `presentation.html`, `docs/` content
- Structural HTML changes beyond the font `<link>` line

## Verification

- Serve locally (`python3 -m http.server`) and screenshot homepage + blog index + one article before/after (Puppeteer MCP available).
- Check mobile breakpoint (≤600px) renders correctly.
- Confirm no horizontal scroll, no layout shift in project rows on hover.
