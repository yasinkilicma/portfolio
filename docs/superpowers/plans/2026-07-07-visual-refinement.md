# Portfolio Visual Refinement Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Refine the minimal portfolio design (typography, spacing tokens, micro-interactions) consistently across the homepage and blog, per `docs/superpowers/specs/2026-07-07-visual-refinement-design.md`.

**Architecture:** Pure CSS refinement. Shared design tokens (`:root` custom properties) are updated identically in `css/style.css` and `blog/blog.css`. The only HTML change is adding the Fraunces font family to the existing Google Fonts `<link>` in every page head. No JS changes, no structural HTML changes, light theme only.

**Tech Stack:** Static HTML/CSS, Google Fonts (Geist + Fraunces), Python http.server + Puppeteer MCP for visual verification.

## Global Constraints

- Light theme only — no dark mode.
- No content/copy changes, no JS changes, no per-article HTML edits beyond the font `<link>` line.
- `--accent` stays `#e85d04`.
- Out of scope: `presentation.html`, `docs/` content.
- Repo: `/Users/yasinkilic/portfolio` (branch `main`). Commit after each task; do NOT push until the user approves.

---

### Task 1: Add Fraunces to the Google Fonts link in all page heads

**Files:**
- Modify: `index.html` (line with `fonts.googleapis.com/css2?family=Geist`)
- Modify: `blog/index.html` and every `blog/*.html` article (same line)

**Interfaces:**
- Produces: `Fraunces` font family (weight 600, optical sizing) available to CSS in Tasks 2–3.

- [ ] **Step 1: Confirm every HTML page uses the same Geist link**

Run:
```bash
cd /Users/yasinkilic/portfolio && grep -rl 'family=Geist' index.html blog/*.html | wc -l && grep -rL 'family=Geist' index.html blog/*.html
```
Expected: first number equals the total count of those HTML files; second command prints nothing (no file missing the link). If some files are missing it, list them and add the full `<link>` block manually to their `<head>`.

- [ ] **Step 2: Add Fraunces to the font URL in all files**

Run:
```bash
cd /Users/yasinkilic/portfolio && LC_ALL=C sed -i '' 's|family=Geist:wght@400;500;600;700|family=Fraunces:opsz,wght@9..144,600\&family=Geist:wght@400;500;600;700|g' index.html blog/*.html
```

- [ ] **Step 3: Verify the replacement**

Run:
```bash
cd /Users/yasinkilic/portfolio && grep -rl 'family=Fraunces' index.html blog/*.html | wc -l && grep -c 'family=Fraunces.*family=Fraunces' index.html
```
Expected: first number equals the file count from Step 1; second command outputs `0` (no double-insertion).

- [ ] **Step 4: Commit**

```bash
cd /Users/yasinkilic/portfolio && git add index.html blog/*.html && git commit -m "feat: load Fraunces display font on all pages

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 2: Design tokens + homepage refinements in css/style.css

**Files:**
- Modify: `css/style.css`

**Interfaces:**
- Consumes: Fraunces font from Task 1.
- Produces: token names reused verbatim in Task 3: `--accent-soft`, `--shadow-sm`, `--shadow-md`, `--space-2/3/4/5/6/8/10`, updated `--transition`.

- [ ] **Step 1: Replace the `:root` block**

Old:
```css
:root {
    --accent: #e85d04;
    --text: #111111;
    --text-muted: #6b7280;
    --bg: #ffffff;
    --border: #e5e7eb;
    --transition: all 0.2s ease;
}
```

New:
```css
:root {
    --accent: #e85d04;
    --accent-soft: #fff3ea;
    --text: #111111;
    --text-muted: #5b6472;
    --bg: #ffffff;
    --border: #e5e7eb;
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.04);
    --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.06);
    --space-2: 16px;
    --space-3: 24px;
    --space-4: 32px;
    --space-5: 40px;
    --space-6: 48px;
    --space-8: 64px;
    --space-10: 80px;
    --transition: all 0.22s cubic-bezier(0.25, 0.6, 0.3, 1);
}
```

- [ ] **Step 2: Hero title — Fraunces, larger size, accent bar**

Replace `.hero-title`:
```css
.hero-title {
    font-family: 'Fraunces', Georgia, serif;
    font-optical-sizing: auto;
    font-size: clamp(2rem, 6vw, 3rem);
    font-weight: 600;
    letter-spacing: -1px;
    color: var(--text);
    margin-bottom: var(--space-2);
}

.hero-title::after {
    content: '';
    display: block;
    width: 32px;
    height: 3px;
    border-radius: 2px;
    background: var(--accent);
    margin-top: 14px;
}
```

- [ ] **Step 3: Hero link — slide-right hover**

Replace `.hero-link` / `.hero-link:hover`:
```css
.hero-link {
    display: inline-block;
    font-size: 0.95rem;
    font-weight: 500;
    color: var(--accent);
    transition: var(--transition);
}

.hero-link:hover {
    transform: translateX(4px);
}
```

- [ ] **Step 4: Nav — accent border underline instead of text-decoration**

Replace `.nav-link` / `.nav-link:hover, .nav-link.active`:
```css
.nav-link {
    display: inline-block;
    font-size: 0.92rem;
    color: var(--text-muted);
    padding-bottom: 3px;
    border-bottom: 2px solid transparent;
    transition: var(--transition);
}

.nav-link:hover,
.nav-link.active {
    color: var(--accent);
    border-bottom-color: var(--accent);
}
```

- [ ] **Step 5: Project rows — accent-soft hover tint, tag pill**

Replace `.project-row` and `.project-row-tag`, add hover rules (keep `.project-row:first-child`, `.project-row-title`, `.project-row-dots` as-is):
```css
.project-row {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 14px 0;
    border-bottom: 1px solid var(--border);
    color: var(--text);
    text-decoration: none;
    transition: var(--transition);
}

.project-row:hover {
    background: var(--accent-soft);
    box-shadow: 0 0 0 8px var(--accent-soft);
}

.project-row-tag {
    font-size: 0.78rem;
    color: var(--text-muted);
    white-space: nowrap;
    padding: 3px 10px;
    border-radius: 20px;
    background: transparent;
    transition: var(--transition);
}

.project-row:hover .project-row-tag {
    background: var(--bg);
    color: var(--accent);
}
```
Note: the `box-shadow` spread trick extends the tint 8px beyond the row without any layout shift.

- [ ] **Step 6: Skill tags — accent-soft hover**

In `.skill-tag:hover`, replace `background: #fee8d8;` with `background: var(--accent-soft);`.

- [ ] **Step 7: Spacing tokens in section paddings**

Replace hardcoded values (visual output identical):
- `.header { padding: 40px 0 0; }` → `padding: var(--space-5) 0 0;`
- `.nav-list { ... padding-bottom: 40px; ... }` → `padding-bottom: var(--space-5);`
- `.hero { padding: 60px 0 80px; }` → `padding: 60px 0 var(--space-10);`
- `.section { padding: 80px 0; }` → `padding: var(--space-10) 0;`
- `.section-label { ... margin-bottom: 32px; }` → `margin-bottom: var(--space-4);`
- `.skills-list { ... gap: 32px; }` → `gap: var(--space-4);`
- `.footer { padding: 40px 0; }` → `padding: var(--space-5) 0;`

- [ ] **Step 8: Contact links — remove underline hover, use easing**

Replace `.contact-email:hover`:
```css
.contact-email:hover {
    color: #c94e00;
}
```

- [ ] **Step 8b: Scroll reveal easing**

Replace the `.reveal` transition line:
```css
.reveal {
    opacity: 0;
    transform: translateY(16px);
    transition: opacity 0.5s cubic-bezier(0.25, 0.6, 0.3, 1), transform 0.5s cubic-bezier(0.25, 0.6, 0.3, 1);
}
```
(`.reveal.active` stays unchanged.)

- [ ] **Step 9: Quick sanity check**

Run:
```bash
cd /Users/yasinkilic/portfolio && grep -c 'var(--accent-soft)' css/style.css && grep -c 'fee8d8' css/style.css
```
Expected: first ≥ 3, second = 0.

- [ ] **Step 10: Commit**

```bash
cd /Users/yasinkilic/portfolio && git add css/style.css && git commit -m "feat: refine homepage design tokens and micro-interactions

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 3: Apply the same tokens to blog/blog.css

**Files:**
- Modify: `blog/blog.css`

**Interfaces:**
- Consumes: token names from Task 2 (`--accent-soft`, `--shadow-sm`, `--shadow-md`, spacing scale, easing) — values must match exactly.

- [ ] **Step 1: Update the `:root` block**

Old:
```css
:root {
    --accent:         #e85d04;
    --accent-red:     #dc2626;
    --accent-green:   #16a34a;
    --accent-blue:    #2563eb;
    --accent-purple:  #7c3aed;
    --text:           #111111;
    --text-muted:     #6b7280;
    --bg:             #ffffff;
    --border:         #e5e7eb;
    --code-bg:        #f6f8fa;
    --transition:     all 0.2s ease;
}
```

New:
```css
:root {
    --accent:         #e85d04;
    --accent-soft:    #fff3ea;
    --accent-red:     #dc2626;
    --accent-green:   #16a34a;
    --accent-blue:    #2563eb;
    --accent-purple:  #7c3aed;
    --text:           #111111;
    --text-muted:     #5b6472;
    --bg:             #ffffff;
    --border:         #e5e7eb;
    --code-bg:        #f6f8fa;
    --shadow-sm:      0 1px 2px rgba(0, 0, 0, 0.04);
    --shadow-md:      0 4px 12px rgba(0, 0, 0, 0.06);
    --space-2: 16px;
    --space-3: 24px;
    --space-4: 32px;
    --space-5: 40px;
    --space-6: 48px;
    --space-8: 64px;
    --space-10: 80px;
    --transition:     all 0.22s cubic-bezier(0.25, 0.6, 0.3, 1);
}
```

- [ ] **Step 2: Fraunces on blog hero title and article h1**

Replace `.blog-hero-title`:
```css
.blog-hero-title {
    font-family: 'Fraunces', Georgia, serif;
    font-optical-sizing: auto;
    font-size: clamp(2rem, 6vw, 3rem);
    font-weight: 600;
    letter-spacing: -1px;
    margin-bottom: 12px;
}
```

Replace the top-level `h1` rule (article pages):
```css
h1 {
    font-family: 'Fraunces', Georgia, serif;
    font-optical-sizing: auto;
    font-size: clamp(1.6rem, 4vw, 2.2rem);
    font-weight: 600;
    line-height: 1.2;
    letter-spacing: -0.5px;
    margin-bottom: 20px;
}
```
Do NOT touch `.content h2` / `.content h3` — those stay Geist/monospace. Note: `blog.css` has a mobile override `h1 { font-size: 1.5rem; }` in `@media (max-width: 600px)` — leave it; clamp already handles small screens, but the override is harmless and keeping it is the surgical choice.

- [ ] **Step 3: Nav — same accent border underline as homepage**

Replace `.nav-link` / `.nav-link:hover, .nav-link.active`:
```css
.nav-link {
    display: inline-block;
    font-size: 0.92rem;
    color: var(--text-muted);
    padding-bottom: 3px;
    border-bottom: 2px solid transparent;
    transition: var(--transition);
}

.nav-link:hover,
.nav-link.active {
    color: var(--accent);
    border-bottom-color: var(--accent);
}
```

- [ ] **Step 4: Post rows — accent-soft hover tint (same trick as project rows)**

Add after the existing `.post` rule:
```css
.post:hover {
    background: var(--accent-soft);
    box-shadow: 0 0 0 8px var(--accent-soft);
}
```

- [ ] **Step 5: Article tags — accent-soft hover**

In `.tag:hover`, replace `background: #fee8d8;` with `background: var(--accent-soft);`.

- [ ] **Step 5b: Tab bar easing**

In `.tab`, replace `transition: color 0.2s, border-color 0.2s;` with `transition: var(--transition);`.

- [ ] **Step 6: Quick sanity check**

Run:
```bash
cd /Users/yasinkilic/portfolio && grep -c 'var(--accent-soft)' blog/blog.css && grep -c 'fee8d8' blog/blog.css && grep -c 'Fraunces' blog/blog.css
```
Expected: first ≥ 3, second = 0, third = 2.

- [ ] **Step 7: Commit**

```bash
cd /Users/yasinkilic/portfolio && git add blog/blog.css && git commit -m "feat: align blog styles with refined design tokens

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 4: Visual verification

**Files:**
- None modified (verification only).

**Interfaces:**
- Consumes: all changes from Tasks 1–3.

- [ ] **Step 1: Serve the site locally**

Run (background):
```bash
cd /Users/yasinkilic/portfolio && python3 -m http.server 8765
```

- [ ] **Step 2: Screenshot desktop pages via Puppeteer MCP**

Navigate and screenshot at default viewport (~1280px wide):
- `http://localhost:8765/index.html`
- `http://localhost:8765/blog/index.html`
- `http://localhost:8765/blog/fortigate-vm-lab-apple-silicon.html`

Check in each screenshot: Fraunces renders on the hero/article title (serif, not fallback sans), accent bar under homepage hero title, muted text readable, no broken layout.

- [ ] **Step 3: Screenshot mobile viewport**

Same three pages with viewport width 390, height 844. Check: no horizontal scroll, project/post rows wrap correctly, hero title fits.

- [ ] **Step 4: Hover behavior spot-check**

Use `puppeteer_hover` on a homepage `.project-row` and screenshot: row shows the soft orange tint extending ~8px beyond the row, tag renders as a white pill with accent text, and row text has NOT shifted horizontally or vertically versus the non-hover screenshot.

- [ ] **Step 5: Stop the server, report results to the user with screenshots**

Kill the background http.server. Summarize what changed and show before/after evidence. Do NOT push — ask the user whether to push to GitHub Pages.
