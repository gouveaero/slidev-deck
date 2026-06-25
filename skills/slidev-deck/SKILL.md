---
name: slidev-deck
description: Use when the user wants to build a presentation, slides, deck, palestra, pitch, keynote, talk, conference talk, demo deck, or sales pitch — anything beyond a vanilla bullet list. Covers animated technical talks, code walkthroughs with Shiki Magic Move, Mermaid/PlantUML diagrams, LaTeX equations, Vue 3 reactive polls/calculators embedded in slides, and Iconify icons. Triggers include "presentation", "slides", "deck", "pitch", "keynote", "talk", "apresentação", "palestra", "apresentar", "demo", or any mention of cinematic transitions, animated reveals, dev-conference style, or "I need to show X to my team/client/class". Builds a self-contained Slidev project that runs 100% locally (double-click launcher on macOS and Windows) — no account, no hosting, no deploy. Use this even when the user doesn't say "Slidev": if they need cinematic slides with code + diagrams + animations that run on their own machine, this is the right skill.
argument-hint: [file-path | topic-description]
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, WebFetch
---

# Slidev Deck — Beautiful Presentations That Run Locally

## Goal

Produce a cinematic, animated presentation as a self-contained **Slidev** project that runs entirely on the user's own machine. The deliverable is a folder containing `slides.md`, the pre-wired component library, cross-platform launchers (double-click on macOS or Windows), a `README.md` explaining how to run it, and a verified local dev preview. **No deploy, no hosting, no account** — the user (or a friend they share the folder with) just installs Node.js once and double-clicks.

## Why this skill exists

Slidev is a powerful presentation framework with ~60 documented features (animations, code-transitions, diagrams, interactive Vue components, layouts). Vanilla decks use about 5 of them. This skill encodes the full surface so every deck reaches the visual ceiling Slidev offers, while keeping authoring markdown-first and the output portable enough to hand to anyone.

When in doubt, **lean on Slidev natives over hand-rolled CSS**. The native `transition: slide-left`, `v-motion`, `magic-move`, `<AutoFitText>`, and `<Toc>` are battle-tested and integrate with Slidev's click system.

This is the **local, portable** variant: it stops at "runs beautifully on your machine and is easy to share as a folder." There is no publishing step.

---

## The 4 phases (mandatory order)

### Phase 1 — Intake

Read any file referenced by `$ARGUMENTS` (use Read / Glob). Identify in 3–4 bullets:

- **Domain** (web, ML, infra, science, marketing, academic, ...)
- **Existing structure** (outline? transcript? raw notes? article?)
- **Tone signals** (formal/casual, didactic/provocative, technical/commercial)
- **Technical artifacts** (snippets, data, diagrams, formulas, links)
- **Language** of the source

### Phase 2 — Discovery

Batch the clarifying questions into a single `AskUserQuestion` call. Skip any question whose answer Phase 1 already revealed.

Question bank:

1. **Central theme** — the thesis/main message in one sentence?
2. **Audience** — devs, managers, an academic panel, a mixed crowd?
3. **Duration** — minutes of talking + Q&A?
4. **Takeaway** — what should the audience remember/do afterward?
5. **Tone** — formal, casual, provocative, didactic, inspirational?
6. **Aesthetic** — minimalist, cinematic, corporate, editorial, brutalist? References (links/images)?
7. **Code/data** — which snippets, numbers, diagrams should appear?
8. **Language** — match the source unless told otherwise.
9. **Destination folder** — default: `./<slug>/` (a new folder named after the title, in the current working directory). Confirm or take a path. Slug suggested from the title.

Confirm in one short sentence what you understood before moving to the outline. (There is intentionally **no deploy question** — this skill never publishes.)

### Phase 3 — Outline approval

Produce a slide-by-slide table. **The number of slides is a function of talk time and density** — there is no fixed template. Use one of the 3 shapes below as a starting point and adjust.

#### Shape A — Short (5–7 slides, 5–12 min)

Quick pitch, demo, internal announcement.

| # | Purpose | Layout | Feature highlight |
|---|---|---|---|
| 1 | Hook + thesis in 1 sentence | `cover` | `<AutoFitText>` |
| 2 | Problem | `fact` or `statement` | `<StatNumber>` |
| 3 | Solution | `default` or `two-cols` | Image or Mermaid |
| 4 | How it works | `default` | Magic Move or Mermaid |
| 5 | Result | `fact` | `<StatNumber>` + `<v-clicks>` |
| 6 | CTA | `statement` | `<v-clicks>` + Iconify |
| 7 | (optional) Thanks/contact | `end` | — |

#### Shape B — Medium (8–12 slides, 15–25 min)

Technical meetup talk, bootcamp class, B2B sales pitch.

| # | Purpose | Suggested layout | Feature highlight |
|---|---|---|---|
| 1 | Hook | `cover` | `<AutoFitText>` |
| 2 | Quick bio | `intro` | — |
| 3 | Thesis / why it matters | `quote` or `statement` | `<QuoteReveal>` |
| 4 | Current state / problem | `fact` | `<StatNumber>` |
| 5 | Technical deep-dive A | `default` | Magic Move or snippet `<<<` |
| 6 | Architecture diagram | `default` | Mermaid |
| 7 | Technical deep-dive B | `two-cols` or `image-right` | Comparison or screenshot |
| 8 | Results / metrics | `default` | `<MetricGrid>` |
| 9 | Lessons / takeaways | `statement` | `<v-clicks>` |
| 10 | Next steps / CTA | `default` | `<v-clicks>` + Iconify |
| 11 | Thanks + contact | `end` | `<QuoteReveal>` |

#### Shape C — Long (13–20 slides, 30–60 min)

Keynote, workshop, thesis defense, internal deep-dive.

Recommended structure (chapters):
- Opening (1–2): cover + intro
- Problem setup (2–3): quote/fact + statement + data
- **Section break** (`layout: section`) between chapters
- Main content in 2–3 chapters of 3–5 slides each
- Demo or interactivity (1–2): `<InteractivePoll>`, `<ROICalculator>`, live iframe
- Synthesis and takeaways (1–2): statement + Toc
- Closing (1): end

Pacing guidelines:
- Alternate dense slides with "breather" slides (1 big image, 1 sentence, 1 number).
- **Vary layouts** — if >60% of the deck is `default` or `center`, you're under-using the other 17. Use 5+ different layouts per deck.
- **Vary transitions with intent** — the headmatter `transition: slide-left | slide-right` + `clickAnimation: up` sets the tone; break it only at narrative beats (section break = `fade`, impact fact = `zoom`, A→B comparison in the same frame = `view-transition`).
- **Coherence > novelty** — a whole deck with the same reveal style (`up`) looks intentional; a deck with 5 different styles looks messy.

End with the literal question: **"Approve this outline? Shall I generate the presentation?"** Do not generate without explicit approval.

### Phase 4 — Generation

1. **Confirm the destination** — default `./<slug>/`. Derive `<slug>` from the title (accent-safe) with `bash "<SKILL_DIR>/scripts/sanitize-slug.sh" "<title>"`. If the folder already exists and isn't empty, ask before overwriting.
2. **Copy templates**: `cp -R "<SKILL_DIR>/templates/." "<TARGET>/"` (Bash, not Glob). This brings the component library, styles, `package.json`, the cross-platform launchers (`start.command`, `start.bat`), and the deck `README.md`.
3. **Make launchers executable** (in case the copy dropped the bit): `chmod +x "<TARGET>/start.command"`.
4. **Write `slides.md`** expanding the outline. For each slide:
   - Title + short subtitle.
   - 1 central idea; use `<v-clicks>` / a custom component for progressive reveal.
   - When the outline calls for a component, use it with realistic props.
   - Presenter notes in `<!-- ... -->` at the end.
   - `transition:` per-slide only when the pacing deliberately changes.
   - `<v-click>` indentation: 0 or 2 spaces (see `references/animations.md` §"v-click pitfalls").
5. **Update `package.json`**: set `"name"` = `<slug>`.
6. **Fill the deck `README.md`**: replace `{{TITLE}}` with the real title. This README is what a friend sees when they open the folder — it must accurately tell them how to run it.
7. **Anti-goto-panel CSS already ships in `styles/index.css`** (rule `.autocomplete-list { display: none !important; }`).
8. **Install deps in background**: `cd <TARGET> && npm install` (run_in_background).
9. **Start the dev server in background**: `cd <TARGET> && npm run dev`. Capture the URL (usually `http://localhost:3030`).
10. **Slide-by-slide visual verification (MANDATORY before reporting to the user)** — Chrome DevTools MCP:
   - `navigate_page → http://localhost:3030/1` → `take_screenshot` → look
   - Repeat for every slide
   - Per-slide checklist: title doesn't show as "undefined" in the sidebar; first-level content visible; no overflow; custom components render.
   - **If anything fails, fix it before reporting.** Known bugs in `references/components.md` §"Pitfalls".

### Phase 4.5 — Validation (mandatory before declaring done)

Two complementary checks, both must pass (exit 0) before you report the deck as ready. The user asked for full quality — do not skip these.

#### Phase 4.5a — `lint-deck.mjs` (technical correctness)

Checks problems that break the deck. Runs **first** (no dev server needed, fast).

```bash
node "<SKILL_DIR>/scripts/lint-deck.mjs" "<TARGET>"
```

Covers:
- Invalid image paths (`<img src="/foo">` with no matching `public/foo`).
- Components used without a matching `components/*.vue` file.
- Iconify tags (`<mdi-*>`, `<lucide-*>`) without `@iconify-json/<set>` in deps.
- Invalid layouts (not one of the 19 built-ins nor a `layouts/*.vue`).
- `var(--foo)` referenced without a `--foo:` declaration in some `:root` or slide `<style>`.
- `<v-clicks>` / `<v-click>` (component) opened without a matching close.
- `mdc:` legacy in headmatter (WARN — suggests migrating to `comark:`; ignore while pinned to 0.50.0).
- `npm run build --base /TEST/` dry-run (FAIL if it breaks).

Output: a markdown report with FAILs (blocking) and WARNs (informational). No FAIL → exit 0.

#### Phase 4.5b — `self-critique.mjs` (aesthetic quality)

Runs **after** the lint, optionally with the dev server up for visual checks.

```bash
node "<SKILL_DIR>/scripts/self-critique.mjs" "<TARGET>" --visual --url http://localhost:3030
# Or without visual (static only, faster):
node "<SKILL_DIR>/scripts/self-critique.mjs" "<TARGET>"
```

Covers aesthetics: word count, H1 count, layout monoculture, gradient-text overuse, em-dash overuse, side-stripe borders, pure #000/#fff, identical card grids, glassmorphism overuse, font count, premium-feature usage. With `--visual`: element overflow past slide bounds, color count per slide.

**Hard rule**: both exit 0 (no FAILs) is a prerequisite for reporting done.

Ordered workflow:
1. After writing `slides.md` → run `lint-deck.mjs`. FAILs here are **structural** (imports, paths, invalid layouts) — fix them.
2. Re-run `lint-deck.mjs` until exit 0.
3. Run `self-critique.mjs` static.
4. Start the dev server (`npm run dev` background).
5. Run `self-critique.mjs --visual --url <localhost>`.
6. Fix visual FAILs.
7. Manual sweep in Chrome DevTools MCP (Phase 4 §10) — subjective checks.

The **subjective** checks (committed color strategy, visible hierarchy, AI-slop test, brand-vs-product register) are yours during Phase 4 — read `references/design-quality.md` before writing `slides.md`. The automated critiques are a safety net, not a substitute for judgment.

### Phase 4.6 — Hand-off (how the user actually runs it)

When everything passes, tell the user — clearly and concretely — how to run the deck themselves and how to share it. This is the payoff of the local-only design:

- **To present:** double-click `start.command` (macOS) or `start.bat` (Windows). First run installs deps (1–2 min), then it opens in the browser at `http://localhost:3030`. Terminal fallback for any OS: `npm install` then `npm run dev`.
- **To share with a friend:** zip the folder and send it (or push it to a Git repo). The recipient needs only [Node.js LTS](https://nodejs.org); everything else is in the folder. `node_modules` is git-ignored, so it stays small. The `README.md` inside walks them through it.
- **Presenter mode:** press `p` in the deck, or open `http://localhost:3030/presenter` — notes + timer + next-slide preview.
- **Export:** `npm run export` (PDF), `npm run export-png` (one PNG per slide), `npm run export-pptx` (PowerPoint). The first export auto-installs the headless browser Slidev needs.

---

## Feature surface — always consult before generating

Slidev offers much more than `v-click` + Shiki. For any slide, first evaluate whether a more expressive feature fits.

**⚠ Slidev version pinned at `0.50.0` (do NOT bump to 52.x).** The template pins `@slidev/cli@0.50.0` + themes `@0.25.0` on purpose: this skill's component library, layouts, lint rules, and `mdc: true` headmatter are all calibrated and verified against `0.50.0`. The 52.x line changed the click system, renamed `mdc:` → `comark:`, and has a `getSlidePath` regression that can break client-side navigation under non-root base paths. Pinning keeps every generated deck reproducible for whoever you hand it to. If you ever want 52.x, treat it as a separate migration (adjust the component API, headmatter keys, and re-verify) — don't just bump the number.

**Headmatter note**: in `0.50.0` the MDC key is `mdc: true` (`comark:` only exists in v52.14+). `lint-deck.mjs` may emit a WARN suggesting `comark:` — ignore it while on `0.50.0`.

**v0.48+ changes** (rewritten click system, named presets, native alerts, `comark:` rename) are documented in `references/v52-features.md`. Features marked **v52+** there (alerts `> [!NOTE]`, `<BlueSky>`, `comark:`) do NOT work on the pinned 0.50.0 — use the classic alternatives (callout via `<div>`/component, `mdc:`).

**Design quality (READ BEFORE WRITING slides.md)**: `references/design-quality.md` — curated UI/UX principles adapted for decks (brand/product register, 4-level color strategy, slide typography, absolute bans, AI-slop test, Phase 4 checklist). The objective checks run automatically in Phase 4.5, but the subjective ones (color strategy, hierarchy, AI slop) are yours — internalizing them before writing saves iterations.

| When the slide is... | Use | Documented in |
|---|---|---|
| Reveal of a list, paragraph, or step | `<v-click>`, `<v-clicks>`, `<v-after>`, presets `.scale` / `.fade.right` / `.up` | `references/animations.md` |
| Inline callout in text (note, warning, etc.) | `> [!NOTE]`, `> [!WARNING]`, `> [!TIP]` (v52.15+ only) | `references/v52-features.md` |
| Positional movement / stagger / scale-bounce | `v-motion` (with `@vueuse/motion`) | `references/animations.md` |
| Toggle A → B (problem vs solution, before vs after) | `<v-switch>` or `<ComparisonSplit>` | `references/animations.md` + `references/components.md` |
| Before/after code with an animated transition | **Shiki Magic Move** (`````magic-move` block) | `references/code-features.md` |
| Inline TS types + compile errors as pop-ups | Twoslash (` ```ts twoslash `) | `references/code-features.md` |
| Live-editable code block (interactive demo) | Monaco editor (`{monaco}`) or runner (`{monaco-run}`) | `references/code-features.md` |
| Real project code (don't duplicate in slides) | Import snippet `<<< @/snippets/file.ts {2-5}` | `references/code-features.md` |
| Architecture, sequence, ER, state diagram | **Mermaid** (`````mermaid {theme: 'neutral'}`) | `references/diagrams.md` |
| Formal UML, ArchiMate, BPMN | PlantUML / Kroki | `references/diagrams.md` |
| Math formula, equation, chemistry | LaTeX `$$ ... $$ {1\|3\|all}` (KaTeX + mhchem) | `references/diagrams.md` |
| Element repositionable during a live talk | `<v-drag>`, `<v-drag-arrow>` | `references/interactive.md` |
| Interactive slide (poll, live calculator, reactive slider) | Vue 3 `<script setup>` + `<InteractivePoll>` / `<ROICalculator>` | `references/interactive.md` |
| 150k+ vector icons | Iconify `<mdi-arrow-right />`, `<heroicons-bolt-solid />` | `references/components.md` |
| Text that must fit a specific box | `<AutoFitText>` | `references/components.md` |
| Embed a video, YouTube, tweet | `<SlidevVideo>`, `<Youtube>`, `<Tweet>` | `references/components.md` |
| Very dense slide that won't fit without rewriting | `zoom: 0.8` in the frontmatter | `references/interactive.md` |
| Persistent animated background, continuous watermark | Global layers (`global-top.vue`, `global-bottom.vue`) | `references/styling.md` |
| CSS isolated per slide, without polluting the rest | `<style scoped>` inside the slide | `references/styling.md` |
| Notes only the presenter sees | `<RenderWhen context="presenter">...</RenderWhen>` + notes in `<!-- -->` | `references/components.md` |

### Layouts (19 built-in, mapped in `references/layouts.md`)

Canonical list of the 19 (verified in `slidevjs/slidev/packages/client/layouts/`):
`center`, `cover`, `default`, `end`, `fact`, `full`, `iframe`, `iframe-left`, `iframe-right`, `image`, `image-left`, `image-right`, `intro`, `none`, `quote`, `section`, `statement`, `two-cols`, `two-cols-header`.

| Slide is... | Layout |
|---|---|
| Formal cover with a big title | `cover` |
| Author intro / initial context | `intro` |
| Chapter separator | `section` |
| Highlighted quote | `quote` |
| Big statement (manifesto) | `statement` |
| Number/statistic as the protagonist | `fact` |
| Image as the main content | `image` |
| Split with image left/right | `image-left` / `image-right` |
| Embedded web page during a demo | `iframe` / `iframe-left` / `iframe-right` |
| 2 balanced columns | `two-cols` (default slot + `::right::`, **never** `::left::` in `two-cols` — slot doesn't exist) |
| Full-width header + 2 columns below | `two-cols-header` (here `::left::` and `::right::` both work) |
| Zero padding, slide fills viewport | `full` |
| Closing | `end` |
| General / default content | `default` |
| No styling, free layout | `none` |
| Content centered vertically and horizontally | `center` |

**If you need a layout not in this list, create a custom one in `layouts/<Name>.vue` of the deck** — don't invent a built-in name. Slidev falls back silently when a layout doesn't exist. See `references/layouts.md` § "Custom layouts".

### Custom components (in `templates/components/`)

| Component | When to use |
|---|---|
| `<CodeReveal>` | Step-by-step code walkthrough with a side note |
| `<StatNumber>` | Animated counter 0→target (uptime, ROI, deploys/day) |
| `<ArchitectureFlow>` | SVG diagram with precise coordinates (node-by-node reveal) |
| `<TerminalDemo>` | Simulated CLI session with typing |
| `<QuoteReveal>` | Quote revealed word by word |
| `<MetricGrid>` | 2×2 or 3×1 grid of KPIs (replaces several loose `<StatNumber>`) |
| `<Timeline>` | Horizontal/vertical timeline with v-motion stagger |
| `<ComparisonSplit>` | Before/after split with v-switch |
| `<CalloutBadge>` | Animated badge ("new", "highlight", "live", "alert") |
| `<InteractivePoll>` | Reactive Vue 3 quiz/poll — click an option, counter rises live |
| `<ROICalculator>` | Reactive calculator (slider input → computed output) |

Full API in `references/components.md`.

---

## Hard rules

Each rule pairs with a "do this instead". When you hesitate, read the "why" — almost all come from real bugs that recurred across decks.

### Process

- **Skipping Discovery (Phase 2) or Outline approval (Phase 3) is forbidden**, even with a rich prompt. Ask the questions Phase 1 left open and confirm the outline before generating. **Why**: the slug, destination, and audience are almost never explicit in the initial prompt; generating without asking usually means a full rework.

### Animations and clicks

- **Don't mix the `v-click` directive with the `<v-click>` component in the same slide.** Pick one pattern. **Why**: both work but they confuse the visual click count. **Do**: directive (`<div v-click>`) for simple HTML; component (`<v-click>`) only when you need to wrap raw markdown that needs parsing.
- **`v-click` with no value = `'+1'` (next click), not "all together".** 3 elements with `<div v-click>` reveal at 1, 2, 3 — in sequence. **Do**: to reveal 2+ on the same click, use `<v-after>` or absolute `v-click="N"`. See `references/animations.md`.
- **Don't use `v-after` or `v-click.hide` to fire `@keyframes` on first view.** **Why**: keyframes run when the element mounts in the DOM, not on click. **Do**: split into TWO slides — splash on slide N, animation on slide N+1.
- **Set the animation aesthetic in the headmatter** (`transition: slide-left | slide-right` + `clickAnimation: up`) and break it only with narrative intent. **Why**: decks that decide transitions case by case look visually incoherent.

### Layouts

- **Use only layouts from the canonical list of 19** (in `references/layouts.md`) or create a custom one in `layouts/<Name>.vue` of the deck. **Why**: invented layouts (e.g. imagining a `two-cols-with-header-and-sidebar`) get a silent fallback. **Do**: if nothing in the list fits, create a custom one — 10 lines of Vue solves it.
- **In `layout: two-cols`, NEVER use `::left::`** — the slot doesn't exist; content vanishes silently. The left column goes in the default slot; the right in `::right::`. **In `two-cols-header`**, both `::left::` and `::right::` work (the default slot becomes the header).
- **The default layout needs** `padding-bottom: 2.5rem+` on `.slidev-layout`. The default bottom padding (1.5–2rem) clips insights/conclusions on projectors with different aspect ratios.

### Images and assets

- **Never use `<img src="/Users/...">` (local absolute path) nor `<img src="../../../thing.png">` (relative going up).** **Do**: put the file in `public/<name>.png` of the deck → reference `<img src="/<name>.png">`. Vite resolves it correctly. See `references/styling.md` § "Assets".

### Components and Iconify

- **Every PascalCase tag (`<StatNumber>`, `<QuoteReveal>`) you reference needs the `components/StatNumber.vue` file in the deck.** **Do**: Phase 4 §2 copies all of `templates/components/*.vue`; if you create a new component, create it in `components/` the moment you write the tag. **Why**: without the file, Vue can't find it; the tag renders literally and the slide breaks visually.
- **Every Iconify tag (`<mdi-*>`, `<lucide-*>`, `<heroicons-*>`) needs `@iconify-json/<set>` in `devDependencies`.** The template ships `mdi`, `lucide`, `heroicons`, `carbon`, `tabler`. If you use another set (`phosphor-*`), run `npm i -D @iconify-json/<set>` before declaring done.

### CSS

- **Every `var(--foo)` you reference needs a `--foo:` declaration in `:root` of `styles/index.css` or in a `<style>` of the same slide.** **Why**: Slidev themes expose only ~10 vars; using `var(--gold)` without declaring it is silent (fallback) and visually broken.
- **A slide `<style>` is always scoped (implicit), no opt-out.** Child combinators (`.a > .b`) silently break because the `[data-v-hash]` attribute doesn't reach the child. **Do**: apply classes directly, or use `:deep(.child)`.
- **Don't put a `<style>` between the global frontmatter and slide 1** — it becomes part of the YAML and corrupts parsing.

### Markdown + Vue

- **Indentation ≥4 spaces becomes a code block in CommonMark.** **Do**: 0 or 2 spaces for `<v-click>`, `<div>` wrappers, etc.
- **Block-level Vue wrappers (`<v-clicks>`, `<v-click>` component, `<template #right>`) need a blank line before AND after the inner markdown.** Without it, markdown-it skips it and everything becomes literal HTML.
- **A plain `<div>` wrapping markdown must NOT have internal blank lines** — markdown treats them as the end of the block and breaks. (Opposite of the previous rule; depends on whether it's a Vue wrapper or plain HTML.)
- **Don't use `<!-- comment -->` inside large `<div>` blocks in markdown** — it closes the block at the comment, and the rest renders as literal code. **Do**: CSS comment inside a scoped `<style>`, or delete it.

### Physical — viewport

- **Slides with 5+ vertical cards** risk clipping the last one in non-16:9 viewports. Keep card vertical padding ≤0.55rem each so 5 items fit comfortably. Always test at `?clicks=99`.

### Language & verification

- **Language**: match the language of the input. Default to the user's language when unclear.
- **Mandatory verification** before reporting done: Phase 4.5a (`lint-deck.mjs`) + Phase 4.5b (`self-critique.mjs`) + Chrome DevTools MCP sweep (Phase 4 §10).

## Rationalization closure

Scenarios where the LLM tends to rationalize, and what to do:

| Temptation | Reality | Do |
|---|---|---|
| "I'll just use `default` and `center` to be safe" | Layouts exist because `fact` frames a statistic as the protagonist in 1s; `default` dilutes it. Under-use = a visually flat deck. | Consult the `references/layouts.md` decision tree for each slide |
| "I'll show the before/after code with 2 side-by-side blocks" | Magic Move is Keynote-grade — the viewer's brain follows the granular transformation instead of comparing two static images | Use `````magic-move` (`references/code-features.md`) |
| "I'll draw the diagram by hand with SVG / ArchitectureFlow" | Mermaid renders natively, semantically, and keeps the theme style. Reserve ArchitectureFlow for precise coordinates only. | Default = Mermaid (`references/diagrams.md`) |
| "Slidev is plain Markdown, I won't use Vue 3" | Vue `<script setup>` in slides.md enables live polls, calculators, sliders — exactly what separates a cinematic deck from a flat one | Consider `<InteractivePoll>` / `<ROICalculator>` when the slide wants interactivity |
| "I'll draw an arrow with `→` in the text" | Iconify has 150k+ icons — `<mdi-arrow-right />` renders as a vector, scales perfectly | Use Iconify (`references/components.md`) |
| "The prompt is detailed, I'll skip Discovery" | The destination folder and slug still need confirming. | Always run Phase 2 |

## Red flags — stop and re-read the references/

If you're thinking any of these, STOP and read the relevant doc before generating:

- "I'll just use `default` and `center`" → `references/layouts.md`
- "Animation? Just `v-clicks` then" → `references/animations.md`
- "Code? A normal ` ```ts ` block" → `references/code-features.md` (especially magic-move)
- "Diagram? I'll write SVG/ASCII" → `references/diagrams.md`
- "Interactivity? Can't do it in Slidev" → `references/interactive.md`
- "I'll use `v-after` to reveal the main content" → the CSS `@keyframes` already run on mount. Split into two slides.
- "I'll leave a `<!-- comment -->` here inside the HTML to document it" → it'll break MDC parsing. Move it to `<style scoped>` or delete it.
- "I'll leave a blank line here to organize the HTML" → markdown treats it as a block break. Join the lines.
- "I checked only slide 1, the rest are probably fine" → always sweep slides with 5+ vertical items and those that animate on the first reveal.

---

## Output at the end of Phase 4.6

Report:

1. Path to the generated folder.
2. URL of the local dev preview.
3. **How to run it without you**: double-click `start.command` (macOS) / `start.bat` (Windows), or `npm run dev`.
4. **How to share it**: zip/Git the folder; recipient needs only Node.js; the included `README.md` explains the rest.
5. Total slides + new features used (e.g. "Magic Move in 2 slides, Mermaid in 1, a Vue 3 poll in 1").
6. Export commands: `npm run export` (PDF), `npm run export-png` (images), `npm run export-pptx` (PowerPoint).
7. "Want to adjust the pacing of any slide, swap the theme, or iterate on an animation?"

## Iteration

- Content changes → `Edit` in `slides.md`.
- New custom component needed → create it in `components/` following the existing pattern; see `references/components.md` §"Authoring custom components".
- Swap theme → adjust `theme:` in the frontmatter (`seriph`, `apple-basic`, `bricks`, `default`, or a gallery theme).
- Pacing → props (`duration`, `speed`, `autoPlay`) or reorganize the `v-click`s.
