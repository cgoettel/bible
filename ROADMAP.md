# Roadmap

Open items only. The live list is the GitLab issue tracker.

## Agent-ready

- [Warn about chapter files missing from bible.tex](https://gitlab.com/colby.goettel/bible/-/work_items/109) (#109): a merge-request check for chapter files with translated verses but no `\input`, and for `\input` lines whose file doesn't exist.

## Owner present

- [Confirm uncertain readings from the November 2026 digitization](https://gitlab.com/colby.goettel/bible/-/work_items/106) (#106): every `xxxx` left by transcribing the handwritten class translations, listed with what the page appears to show. Needs the owner, the BHS, and the original pages.
- [Footnote issues](https://gitlab.com/colby.goettel/bible/-/work_items/70) (#70), with [Speed up compilation time](https://gitlab.com/colby.goettel/bible/-/work_items/99) (#99) and [Header issues](https://gitlab.com/colby.goettel/bible/-/work_items/50) (#50): verse-keyed footnote marks would end latexmk's never-converging builds. Design together, starting with a mock-up page.
- [Work through the remaining ChkTeX warnings](https://gitlab.com/colby.goettel/bible/-/work_items/108) (#108): 142 warnings left after the repo `.chktexrc`, a handful of them real text bugs.
- [Replace \\sloppy with emergencystretch and add microtype](https://gitlab.com/colby.goettel/bible/-/work_items/107) (#107): tighter line spacing and optical margins, judged on before-and-after renders.
- [Switch the body font to Noto Serif, with size and leading set per Bringhurst](https://gitlab.com/colby.goettel/bible/-/work_items/28) (#28): Noto Serif is chosen; compare a few size and leading settings as rendered pages first. Also closes [Italicized small caps](https://gitlab.com/colby.goettel/bible/-/work_items/92) (#92). Settle before #107.
- [Book, chapter, verse page flow](https://gitlab.com/colby.goettel/bible/-/work_items/4) (#4) and [Chapter heading: number doesn't align](https://gitlab.com/colby.goettel/bible/-/work_items/100) (#100): investigate with screenshots before changing anything.
- [Make the table of contents and cross-references clickable](https://gitlab.com/colby.goettel/bible/-/work_items/110) (#110): hyperref's automatic anchors shifted line breaks, so they're off; find a way to link without moving the pages.
- [Drop enumitem by resetting the preface's abbreviation list](https://gitlab.com/colby.goettel/bible/-/work_items/111) (#111): enumitem serves one preface list; reset it and remove the package.
