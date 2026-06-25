# slidev-deck

A [Claude](https://claude.com/claude-code) **skill** that turns a topic, an outline, or a rough document into a **beautiful, animated [Slidev](https://sli.dev) presentation that runs 100% on your own machine** — no account, no hosting, no deploy. When it's done, you double-click one file and the deck opens in your browser.

It's built for talks, pitches, keynotes, lectures, and demos where plain bullet points won't cut it: cinematic transitions, animated code walkthroughs (Shiki Magic Move), Mermaid diagrams, LaTeX equations, live Vue components (polls, calculators), and 150k+ Iconify icons.

---

## What you get

Ask Claude for a presentation and you get a self-contained folder:

```
my-talk/
├── ▶ start.command     ← double-click on macOS
├── ▶ start.bat         ← double-click on Windows
├── README.md           ← how to run it (for whoever you share it with)
├── slides.md           ← all the content, in Markdown
├── components/         ← pre-wired animated Vue components
├── styles/
└── package.json
```

- **Runs locally.** Double-click the launcher → it installs what it needs the first time → opens at `http://localhost:3030`.
- **Easy to share.** Zip the folder (or push it to a repo) and send it. The recipient only needs [Node.js](https://nodejs.org); the included `README.md` walks them through it. `node_modules` is git-ignored, so the folder stays small.
- **Presenter mode** (speaker notes + timer), and one-command **export to PDF / PNG / PowerPoint**.

## Requirements

- **To run a generated deck:** [Node.js LTS](https://nodejs.org) (free, one-time install). That's it.
- **To generate decks:** an environment that supports Claude skills — e.g. [Claude Code](https://claude.com/claude-code).

## Install the skill

Copy the skill into your Claude skills directory:

```bash
# Claude Code (per-user skills live in ~/.claude/skills/)
git clone https://github.com/gouveaero/slidev-deck.git
cp -R slidev-deck/skills/slidev-deck ~/.claude/skills/
```

Restart your Claude session so it picks up the new skill. (If your setup keeps skills somewhere else, drop the `skills/slidev-deck/` folder there instead.)

## Use it

Just ask, in plain language:

> "Make me a 10-minute pitch deck about our new analytics product — dark, cinematic, with a before/after code slide and a metrics slide."

Claude will ask a few quick questions (audience, tone, where to save it), show you a slide-by-slide outline for approval, then build, lint, and visually verify the deck before handing it over. You finish by double-clicking the launcher.

To run a finished deck yourself, see the `README.md` inside the generated folder, or from a terminal:

```bash
cd my-talk
npm install   # first time only
npm run dev    # opens http://localhost:3030
```

## How it works

The skill drives a fixed pipeline: **intake → clarifying questions → outline approval → generation → quality checks**. It ships a curated component library, a layout/feature decision guide, and two verification scripts — `lint-deck.mjs` (catches broken image paths, missing components, invalid layouts, build failures) and `self-critique.mjs` (flags aesthetic anti-patterns). Slidev is pinned to a known-good version for reproducibility, so a deck you build today renders the same for anyone you hand it to.

## Credits

Built on top of [Slidev](https://sli.dev) by Anthony Fu and contributors. This skill is an independent helper that scaffolds and verifies Slidev projects.

## License

[MIT](./LICENSE) — do whatever you like, no warranty.
