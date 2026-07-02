# Portfolio Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Redesign yasinkilicma/portfolio from a "modern web template" aesthetic to a minimal, typography-driven personal site inspired by arslan.io.

**Architecture:** Three files change — `css/style.css` (full rewrite), `index.html` (structural markup changes per section), `js/script.js` (simplified, dark mode removed). No new files, no build step, GitHub Pages compatible.

**Tech Stack:** Vanilla HTML/CSS/JS · Geist font via Google Fonts CDN · GitHub Pages

## Global Constraints

- Max content width: `680px` centered
- Accent color: `#e85d04` (orange) — replaces all blue `#2563eb`
- Font: Geist (Google Fonts) — replaces Inter
- Dark mode: removed entirely (no toggle, no `[data-theme="dark"]` CSS, no `localStorage` theme)
- No cards, no box-shadows on content, no progress bars
- Single-column layout throughout

---

### Task 1: Clone repo + verify locally

**Files:**
- Working directory: local clone of `git@github.com:yasinkilicma/portfolio.git`

- [ ] **Step 1: Clone the repo**

```bash
git clone git@github.com:yasinkilicma/portfolio.git
cd portfolio
```

- [ ] **Step 2: Open in browser to see current state**

```bash
open index.html
```

Expected: current blue-accented, card-based portfolio loads correctly.

- [ ] **Step 3: Confirm working tree is clean**

```bash
git status
```

Expected: `nothing to commit, working tree clean`

---

### Task 2: CSS — Full rewrite of style.css

**Files:**
- Modify: `css/style.css` (complete replacement)

- [ ] **Step 1: Replace css/style.css with the new design system**

Overwrite the entire file with:

```css
/* ============================================
   Variables
   ============================================ */
:root {
    --accent: #e85d04;
    --text: #111111;
    --text-muted: #6b7280;
    --bg: #ffffff;
    --border: #e5e7eb;
    --transition: all 0.2s ease;
}

/* ============================================
   Base
   ============================================ */
*, *::before, *::after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
    font-size: 16px;
}

body {
    font-family: 'Geist', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    background: var(--bg);
    color: var(--text);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
}

a {
    color: inherit;
    text-decoration: none;
}

ul {
    list-style: none;
}

.container {
    max-width: 680px;
    margin: 0 auto;
    padding: 0 24px;
}

/* ============================================
   Header
   ============================================ */
.header {
    padding: 40px 0 0;
}

.site-name {
    font-size: 1.4rem;
    font-weight: 700;
    letter-spacing: -0.5px;
    margin-bottom: 20px;
}

.site-name a {
    color: var(--text);
}

.nav-list {
    display: flex;
    gap: 24px;
    flex-wrap: wrap;
    padding-bottom: 40px;
    border-bottom: 1px solid var(--border);
}

.nav-link {
    font-size: 0.92rem;
    color: var(--text-muted);
    transition: var(--transition);
}

.nav-link:hover,
.nav-link.active {
    color: var(--accent);
    text-decoration: underline;
    text-underline-offset: 4px;
}

/* ============================================
   Hero
   ============================================ */
.hero {
    padding: 60px 0 80px;
}

.hero-title {
    font-size: clamp(1.75rem, 5vw, 2.5rem);
    font-weight: 700;
    letter-spacing: -1px;
    color: var(--text);
    margin-bottom: 16px;
}

.hero-subtitle {
    font-size: 1.05rem;
    color: var(--text-muted);
    margin-bottom: 12px;
}

.hero-description {
    font-size: 1rem;
    color: var(--text-muted);
    line-height: 1.7;
    margin-bottom: 28px;
}

.hero-link {
    font-size: 0.95rem;
    font-weight: 500;
    color: var(--accent);
    transition: var(--transition);
}

.hero-link:hover {
    text-decoration: underline;
    text-underline-offset: 4px;
}

/* ============================================
   Sections
   ============================================ */
.section {
    padding: 80px 0;
    border-top: 1px solid var(--border);
}

.section-label {
    font-size: 0.72rem;
    font-weight: 600;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--text-muted);
    margin-bottom: 32px;
}

/* ============================================
   About
   ============================================ */
.about-text p {
    font-size: 1rem;
    color: var(--text-muted);
    line-height: 1.8;
    margin-bottom: 16px;
}

.about-text p:last-child {
    margin-bottom: 0;
}

/* ============================================
   Projects
   ============================================ */
.projects-list {
    display: flex;
    flex-direction: column;
}

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

.project-row:first-child {
    border-top: 1px solid var(--border);
}

.project-row-title {
    font-size: 0.95rem;
    font-weight: 500;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    transition: color 0.2s ease;
}

.project-row:hover .project-row-title {
    color: var(--accent);
}

.project-row-dots {
    flex: 1;
    height: 1px;
    border-top: 1px dotted var(--border);
    min-width: 20px;
}

.project-row-tag {
    font-size: 0.78rem;
    color: var(--text-muted);
    white-space: nowrap;
}

/* ============================================
   Skills
   ============================================ */
.skills-list {
    display: flex;
    flex-direction: column;
    gap: 32px;
}

.skill-group-title {
    font-size: 0.9rem;
    font-weight: 600;
    color: var(--text);
    margin-bottom: 12px;
}

.skill-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
}

.skill-tag {
    font-size: 0.82rem;
    font-weight: 500;
    padding: 4px 12px;
    background: #f3f4f6;
    color: var(--text-muted);
    border-radius: 20px;
    transition: var(--transition);
}

.skill-tag:hover {
    background: #fee8d8;
    color: var(--accent);
}

/* ============================================
   Contact
   ============================================ */
.contact-text {
    font-size: 1rem;
    color: var(--text-muted);
    line-height: 1.7;
    margin-bottom: 24px;
}

.contact-email {
    display: block;
    font-size: 1.15rem;
    font-weight: 600;
    color: var(--accent);
    margin-bottom: 12px;
    transition: var(--transition);
}

.contact-email:hover {
    text-decoration: underline;
    text-underline-offset: 4px;
}

.contact-linkedin {
    font-size: 0.95rem;
    font-weight: 500;
    color: var(--text-muted);
    transition: var(--transition);
}

.contact-linkedin:hover {
    color: var(--accent);
}

/* ============================================
   Footer
   ============================================ */
.footer {
    padding: 40px 0;
    border-top: 1px solid var(--border);
}

.footer p {
    font-size: 0.85rem;
    color: var(--text-muted);
}

/* ============================================
   Responsive
   ============================================ */
@media (max-width: 600px) {
    .project-row-dots {
        display: none;
    }

    .project-row-title {
        white-space: normal;
        overflow: visible;
        text-overflow: unset;
    }
}

/* ============================================
   Scroll Reveal
   ============================================ */
.reveal {
    opacity: 0;
    transform: translateY(16px);
    transition: opacity 0.5s ease, transform 0.5s ease;
}

.reveal.active {
    opacity: 1;
    transform: translateY(0);
}
```

- [ ] **Step 2: Verify the file saved correctly**

```bash
head -5 css/style.css
```

Expected: `/* ============================================` and `:root {`

- [ ] **Step 3: Commit**

```bash
git add css/style.css
git commit -m "style: rewrite CSS — Geist font, orange accent, remove dark mode"
```

---

### Task 3: HTML — `<head>` and header section

**Files:**
- Modify: `index.html` — `<head>` block and `<header>` element

- [ ] **Step 1: Replace the two font `<link>` tags in `<head>`**

Find these lines in `<head>`:
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

Replace with:
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist:wght@400;500;700&display=swap" rel="stylesheet">
```

- [ ] **Step 2: Replace the entire `<header>` element**

Find the entire `<header class="header">` block and replace with:

```html
<header class="header">
    <div class="container">
        <h1 class="site-name"><a href="#">Yasin Kilic</a></h1>
        <nav class="nav" id="nav">
            <ul class="nav-list">
                <li><a href="#" class="nav-link active">Home</a></li>
                <li><a href="#projects" class="nav-link">Projects</a></li>
                <li><a href="blog/index.html" class="nav-link">Blog</a></li>
                <li><a href="#skills" class="nav-link">Skills</a></li>
                <li><a href="#contact" class="nav-link">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>
```

- [ ] **Step 3: Open browser and verify**

```bash
open index.html
```

Expected: "Yasin Kilic" appears as a heading at top-left, nav below it with orange hover on links. No hamburger, no theme toggle.

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "feat: static header with name heading, simplified nav"
```

---

### Task 4: HTML — Hero section

**Files:**
- Modify: `index.html` — `<section class="hero">` block

- [ ] **Step 1: Replace the entire hero section**

Find `<!-- Hero Section -->` and replace the entire `<section class="hero">` block with:

```html
<!-- Hero Section -->
<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h2 class="hero-title">Hi, I'm Yasin</h2>
            <p class="hero-subtitle">Data Center Engineer based in Mannheim.</p>
            <p class="hero-description">
                5+ years in server infrastructure, Cisco networking, and security automation.
                CompTIA Network+ · Security+ · CySA+
            </p>
            <a href="#projects" class="hero-link">→ View my projects</a>
        </div>
    </div>
</section>
```

- [ ] **Step 2: Open browser and verify**

```bash
open index.html
```

Expected: compact hero with plain black heading "Hi, I'm Yasin", muted subtitle, orange arrow link. No gradient, no two buttons, not full-viewport-height.

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: compact hero — plain heading, single orange link"
```

---

### Task 5: HTML — About section

**Files:**
- Modify: `index.html` — `<section class="section about">` block

- [ ] **Step 1: Replace the entire about section**

Find `<!-- About Section -->` and replace the entire `<section class="section about">` block with:

```html
<!-- About Section -->
<section class="section about" id="about">
    <div class="container">
        <p class="section-label">About</p>
        <div class="about-text">
            <p>
                I am a Data Center Field Engineer based in Germany with 5+ years of hands-on experience
                at Computacenter and Allgeier Experts. My day-to-day work spans server rack installation,
                Cisco switch and router configuration, structured cabling, IMAC activities, and remote hands
                support for enterprise clients across the Rhine-Neckar region.
            </p>
            <p>
                Beyond field operations, I build network automation and security tooling — CIS-compliant
                Ansible hardening playbooks, SNMP-based topology mappers, and Python security audit tools.
                I hold <strong>CompTIA Network+, Security+, and CySA+</strong> certifications and a
                Bachelor's degree in IT Engineering from Bilecik University.
            </p>
            <p>
                I have a strong interest in network security and SOC operations. I actively work on
                home labs — building Splunk-based SIEM environments, investigating real attack datasets,
                and studying threat detection techniques. My long-term goal is to combine my deep
                infrastructure background with security expertise in a Network Security or SOC Engineering role.
            </p>
        </div>
    </div>
</section>
```

- [ ] **Step 2: Open browser and verify**

```bash
open index.html
```

Expected: "ABOUT" label in small muted caps, three paragraphs in muted text. No stat boxes, no alternate background color.

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: about section — remove stat boxes, single column text"
```

---

### Task 6: HTML — Projects section (list format)

**Files:**
- Modify: `index.html` — `<section class="section projects">` block

- [ ] **Step 1: Replace the entire projects section**

Find `<!-- Projects Section -->` and replace the entire `<section class="section projects">` block with:

```html
<!-- Projects Section -->
<section class="section projects" id="projects">
    <div class="container">
        <p class="section-label">Projects</p>
        <div class="projects-list">

            <a href="blog/lab-architektur-uebersicht-de.html" class="project-row">
                <span class="project-row-title">Home-Lab Architektur — FortiGate + Splunk SOC</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">FortiGate</span>
            </a>

            <a href="blog/fortigate-vm-lab-apple-silicon.html" class="project-row">
                <span class="project-row-title">FortiGate-VM Lab on Apple Silicon (UTM)</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">UTM / QEMU</span>
            </a>

            <a href="blog/fortigate-lab-attacker-client-socket.html" class="project-row">
                <span class="project-row-title">Attacker-Client behind FortiGate — QEMU Socket Networking</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">QEMU</span>
            </a>

            <a href="blog/fortigate-ips-custom-signature-test.html" class="project-row">
                <span class="project-row-title">FortiGate IPS Test with a Custom Signature</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">IPS / NSE4</span>
            </a>

            <a href="blog/fortigate-antivirus-eicar-test.html" class="project-row">
                <span class="project-row-title">FortiGate AntiVirus Test with EICAR</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">AntiVirus</span>
            </a>

            <a href="blog/soc-lab-splunk-ransomware-analyse-de.html" class="project-row">
                <span class="project-row-title">SOC Home Lab — Splunk SIEM &amp; Full Cerber Kill Chain</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">Splunk</span>
            </a>

            <a href="blog/win-security-overview-de.html" class="project-row">
                <span class="project-row-title">Windows Security Event Log — 5-Scenario Kill Chain</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">Active Directory</span>
            </a>

            <a href="blog/sap-security-overview-de.html" class="project-row">
                <span class="project-row-title">SAP Security Audit Log — Insider Threat &amp; Privilege Abuse</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">SAP / Splunk</span>
            </a>

            <a href="blog/soc-port-scan-detection-de.html" class="project-row">
                <span class="project-row-title">Port-Scan-Erkennung mit FortiGate &amp; Splunk</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">nmap</span>
            </a>

            <a href="blog/soc-suricata-ids-de.html" class="project-row">
                <span class="project-row-title">Suricata IDS — Web-Angriffs-Analyse (BOTS v1)</span>
                <span class="project-row-dots"></span>
                <span class="project-row-tag">Suricata</span>
            </a>

        </div>
    </div>
</section>
```

- [ ] **Step 2: Open browser and verify**

```bash
open index.html
```

Expected: "PROJECTS" label, then a clean list of project titles with dotted lines and tags on the right. Title turns orange on hover. No cards, no images, no shadows.

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: projects as list — title + dotted line + tag"
```

---

### Task 7: HTML — Skills section (tag cloud)

**Files:**
- Modify: `index.html` — `<section class="section skills">` block

- [ ] **Step 1: Replace the entire skills section**

Find `<!-- Skills Section -->` and replace the entire `<section class="section skills">` block with:

```html
<!-- Skills Section -->
<section class="section skills" id="skills">
    <div class="container">
        <p class="section-label">Skills</p>
        <div class="skills-list">

            <div class="skill-group">
                <h3 class="skill-group-title">Data Center &amp; Infrastructure</h3>
                <div class="skill-tags">
                    <span class="skill-tag">DC Operations &amp; Remote Hands</span>
                    <span class="skill-tag">Server Hardware &amp; Rack &amp; Stack</span>
                    <span class="skill-tag">IMAC &amp; Structured Cabling</span>
                    <span class="skill-tag">ServiceNow / IT-Direct / SPC</span>
                </div>
            </div>

            <div class="skill-group">
                <h3 class="skill-group-title">Network Engineering</h3>
                <div class="skill-tags">
                    <span class="skill-tag">Cisco IOS — Switching &amp; Routing</span>
                    <span class="skill-tag">TCP/IP &amp; VLANs</span>
                    <span class="skill-tag">Wireshark</span>
                    <span class="skill-tag">SNMP / LLDP / CDP</span>
                    <span class="skill-tag">FortiGate · NSE4</span>
                </div>
            </div>

            <div class="skill-group">
                <h3 class="skill-group-title">Security &amp; SOC</h3>
                <div class="skill-tags">
                    <span class="skill-tag">Splunk SIEM</span>
                    <span class="skill-tag">MITRE ATT&amp;CK</span>
                    <span class="skill-tag">Threat Hunting &amp; Log Forensics</span>
                    <span class="skill-tag">Suricata IDS</span>
                    <span class="skill-tag">CompTIA CySA+ / Security+ / Network+</span>
                </div>
            </div>

            <div class="skill-group">
                <h3 class="skill-group-title">Automation &amp; Tooling</h3>
                <div class="skill-tags">
                    <span class="skill-tag">Python</span>
                    <span class="skill-tag">Ansible</span>
                    <span class="skill-tag">Docker</span>
                    <span class="skill-tag">Terraform</span>
                    <span class="skill-tag">Linux / UTM / QEMU</span>
                    <span class="skill-tag">Git</span>
                </div>
            </div>

        </div>
    </div>
</section>
```

- [ ] **Step 2: Open browser and verify**

```bash
open index.html
```

Expected: "SKILLS" label, four category headings, pill-shaped tags below each. Tags go light orange on hover. No progress bars, no cards.

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: skills as tag cloud — remove progress bars and cards"
```

---

### Task 8: HTML — Contact and Footer sections

**Files:**
- Modify: `index.html` — `<section class="section contact">` and `<footer>` blocks

- [ ] **Step 1: Replace the entire contact section**

Find `<!-- Contact Section -->` and replace the entire `<section class="section contact">` block with:

```html
<!-- Contact Section -->
<section class="section contact" id="contact">
    <div class="container">
        <p class="section-label">Contact</p>
        <p class="contact-text">
            Open to Network Security and SOC-adjacent roles in the Mannheim / Rhine-Neckar region
            and remote opportunities across Germany.
        </p>
        <a href="mailto:yasin.kilic@proton.me" class="contact-email">yasin.kilic@proton.me</a>
        <a href="https://www.linkedin.com/in/yasin-kilic-cyber-security/?locale=en" target="_blank" rel="noopener noreferrer" class="contact-linkedin">LinkedIn →</a>
    </div>
</section>
```

- [ ] **Step 2: Replace the footer**

Find `<footer class="footer">` and replace with:

```html
<footer class="footer">
    <div class="container">
        <p>© 2026 Yasin Kilic</p>
    </div>
</footer>
```

- [ ] **Step 3: Open browser and verify**

```bash
open index.html
```

Expected: "CONTACT" label, short text, orange email link, plain "LinkedIn →" text link. Footer is one line, left-aligned, no alternate background.

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "feat: contact left-aligned with text links, minimal footer"
```

---

### Task 9: JS — Simplify script.js

**Files:**
- Modify: `js/script.js` (complete replacement)

- [ ] **Step 1: Replace js/script.js with simplified version**

Overwrite the entire file with:

```js
// Scroll reveal
const revealElements = document.querySelectorAll(
    '.section-label, .about-text, .project-row, .skill-group, .contact-text, .contact-email'
);

const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('active');
            revealObserver.unobserve(entry.target);
        }
    });
}, {
    threshold: 0.1,
    rootMargin: '0px 0px -30px 0px'
});

revealElements.forEach(el => {
    el.classList.add('reveal');
    revealObserver.observe(el);
});

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href === '#') return;
        e.preventDefault();
        const target = document.querySelector(href);
        if (target) {
            target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    });
});
```

- [ ] **Step 2: Open browser, open DevTools console, verify no errors**

```bash
open index.html
```

Expected: browser console shows no errors. Scroll down — sections fade in smoothly. No theme toggle, no hamburger.

- [ ] **Step 3: Commit**

```bash
git add js/script.js
git commit -m "refactor: remove dark mode and hamburger JS, simplify to scroll reveal"
```

---

### Task 10: Final review + push to GitHub

**Files:**
- Read-only review pass

- [ ] **Step 1: Full visual review in browser**

```bash
open index.html
```

Checklist:
- [ ] Header: "Yasin Kilic" as heading, nav below, no sticky, no toggle
- [ ] Hero: compact, plain black text, orange `→ View my projects`
- [ ] About: muted text, no stats, no alternate background
- [ ] Projects: list with dotted lines + tags, orange title on hover
- [ ] Skills: four groups, pill tags, orange hover
- [ ] Contact: left-aligned, orange email, plain LinkedIn link
- [ ] Footer: single line
- [ ] No console errors
- [ ] Mobile (resize to 375px): nav wraps, project dots hide, layout intact

- [ ] **Step 2: Check git log is clean**

```bash
git log --oneline -8
```

Expected: 7 commits visible from this plan.

- [ ] **Step 3: Push to GitHub**

```bash
git push origin main
```

- [ ] **Step 4: Verify on GitHub Pages**

Open `https://yasinkilicma.github.io/portfolio/` in browser.

Expected: redesigned site live. Geist font loads, orange accent, list-based projects, tag cloud skills.
