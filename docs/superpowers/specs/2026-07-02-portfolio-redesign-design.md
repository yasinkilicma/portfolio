# Portfolio Redesign — Design Spec
**Date:** 2026-07-02  
**Inspiration:** arslan.io  
**Scope:** `index.html` + `css/style.css` only — no new files, no build step

---

## Goal

Shift from a "modern web template" aesthetic to a minimal, typography-driven personal site
inspired by arslan.io. Prioritize content over decoration.

---

## Design Tokens

| Token | Value |
|---|---|
| Font | Geist (Google Fonts CDN — Regular 400, Medium 500, Bold 700) |
| Accent | `#e85d04` (warm orange) |
| Text | `#111111` |
| Text muted | `#6b7280` |
| Background | `#ffffff` |
| Border | `#e5e7eb` |
| Max width | `680px` |
| Dark mode | Removed |

---

## Layout

Single-column, centered at `max-width: 680px`. Consistent left-aligned text.
Section spacing: `80–100px` vertical padding.

---

## Header

- **Remove:** `position: fixed`, backdrop-blur, "YK" logo, theme toggle, hamburger menu button
- **Add:** `<h1 class="site-name">Yasin Kilic</h1>` as top-of-page heading (large, bold, black)
- Nav sits directly below the name, left-aligned, horizontal
- Active nav link: orange + underline
- Mobile: nav links wrap naturally

```
Yasin Kilic

Home   Projects   Blog   Skills   Contact
```

---

## Hero Section

- **Remove:** `min-height: 100vh`, gradient text, two CTA buttons, "Hello, I'm" greeting
- **Add:** compact `padding: 60px 0 80px`
- Heading: `Hi, I'm Yasin` — plain black, no gradient
- Subtitle: one line — *Data Center Engineer based in Mannheim.*
- Description: max 2 sentences
- Single text link: `→ View my projects` in orange

```
Hi, I'm Yasin

Data Center Engineer based in Mannheim.
5+ years in server infrastructure, Cisco networking, and security automation.
CompTIA Network+ · Security+ · CySA+

→ View my projects
```

---

## About Section

- **Remove:** 2-column grid, stat boxes (5+ years / 3 certs / 12 projects), alternate background
- **Add:** `ABOUT` section label (small-caps, muted, 0.75rem)
- Single-column plain text, 2–3 paragraphs
- Background: white (same as rest of page)

---

## Projects Section

- **Remove:** 3-column card grid, placeholder images, box-shadows, borders on cards
- **Add:** `PROJECTS` section label
- List format: one project per row
  - Left: project title (links to blog post)
  - Right: primary tag (e.g. `FortiGate`, `Splunk`)
  - Dotted line fills the gap between title and tag
  - Title turns orange on hover

```
PROJECTS

Home-Lab Architektur — FortiGate + Splunk ············· FortiGate
FortiGate-VM Lab on Apple Silicon ··················· UTM/QEMU
SOC Home Lab — Splunk SIEM & Cerber Kill Chain ···· Splunk
Windows Security Event Log — 5-Scenario Kill Chain · Active Directory
SAP Security Audit Log Analysis ···················· SAP/Splunk
Port-Scan-Erkennung mit FortiGate & Splunk ·········· nmap
Suricata IDS — Web-Angriffs-Analyse (BOTS v1) ····· Suricata
```

---

## Skills Section

- **Remove:** card grid, progress bars
- **Add:** `SKILLS` section label
- 4 category headings (plain text, medium weight)
- Inline tag pills below each category: light grey background, orange on hover

```
SKILLS

Data Center & Infrastructure
[DC Operations] [Server Hardware] [IMAC] [ServiceNow]

Network Engineering
[Cisco IOS] [TCP/IP] [VLANs] [FortiGate] [Wireshark] [SNMP]

Security & SOC
[Splunk SIEM] [MITRE ATT&CK] [Threat Hunting] [CompTIA CySA+] [Suricata]

Automation & Tooling
[Python] [Ansible] [Docker] [Terraform] [Linux] [Git]
```

---

## Contact Section

- **Remove:** centered layout, LinkedIn icon button
- **Add:** `CONTACT` section label, left-aligned
- 1-sentence opening
- Email as styled link (orange, large)
- LinkedIn as plain text link: `LinkedIn →`

```
CONTACT

Open to Network Security and SOC-adjacent roles in Germany.

yasin.kilic@proton.me
LinkedIn →
```

---

## Footer

- Single line, left-aligned: `© 2026 Yasin Kilic`
- No alternate background

---

## What Gets Removed

- `position: fixed` header
- Backdrop blur
- Theme toggle (dark mode entirely)
- `[data-theme="dark"]` CSS block
- Gradient text on hero title
- `min-height: 100vh` hero
- Two-button hero CTA
- Stat boxes in About
- Alternate section backgrounds
- Project cards (images, shadows, borders)
- Skill progress bars
- Skill category cards
- Centered contact layout
- LinkedIn icon SVG

---

## Files Changed

| File | Change |
|---|---|
| `css/style.css` | Full rewrite of design tokens, header, hero, about, projects, skills, contact, footer |
| `index.html` | Structural tweaks: site-name heading, nav simplification, project list markup, skill tag markup, remove dark mode JS |
| `js/script.js` | Remove theme toggle logic |
