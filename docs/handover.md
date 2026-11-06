# Handover

The knowledge-transfer survey from [#103 "Staff-engineer handover: knowledge transfer and "what would you do differently?""](https://gitlab.com/colby.goettel/bible/-/work_items/103), run on 2026-11-05. It holds what was read, the question-and-answer log with where each answer was written into the docs, and the ranked proposals. The docs are the handover; this file is the record of how they got there.

## What was read

- `README.md` (the style guide), `CONTRIBUTING.md`, `ROADMAP.md`, `preface.tex`, `bible.tex`, `.latexmkrc`, `.gitlab-ci.yml`, `paginate.pl`, and the since-deleted `Makefile` and `translate-character.pl`
- Every open issue and the closed list (most closed issues predate the move to GitLab and have no close date)
- `git log`: about 780 commits, 671 of them from 2013 to 2015, then a long quiet stretch until 2026
- Past Claude Code sessions through genizah (keyword mode only)
- The 2026-11-05 session itself: the November digitization and !102 through !110

## How it runs and fails

- **Build:** `latexmk bible.tex` (`CONTRIBUTING.md`). It never converges because per-page footnote numbering flips between passes, so `.latexmkrc` runs in force mode; see [#70 "Footnote issues"](https://gitlab.com/colby.goettel/bible/-/work_items/70).
- **CI:** `build_pdf` on merge requests; `build_pdf`, `pages`, and the GitHub mirror on `main`, all on `bible-runner` in smart-home (!106, !110, smart-home !912). From about 2026-10-27 to 2026-11-05 no pipeline ran at all: shared runners were off and bible had no runner.
- **Release:** CI publishes `bible.pdf` to GitLab Pages on every push to `main`; the README links there. The PDF is no longer committed (decided after question 30; see proposal P6).
- **Backups:** GitLab, the GitHub mirror, and smart-home's nightly `gitlab-backup`. The handwritten pages themselves are the one thing with no copy beyond the photos.
- **Silent failures:** a chapter file that isn't `\input` never appears and nothing warns; a font missing a glyph prints nothing except a `Missing character` line in the log (this is how Syriac and versio Arabica went unnoticed until !105).

## Questions and answers

| #   | Question                                                  | Answer                                                                                                                                                                                                                             | Written into                                          |
| --- | --------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| 25  | What's the endgame?                                       | A self-published print edition, as the abstract goal that shapes the design (5.25 × 8 inches, facing pages), even if it's never printed.                                                                                           | This log; it frames proposals P2 and P3               |
| 26  | What does a commented-out `\input` mean?                  | The file has nothing translated yet. Genesis 31 has one note and no translation.                                                                                                                                                   | README, "Adding a chapter"                            |
| 27  | Has the `%%` → `%` revision pass started?                 | `%%` is a line translated once; `%` is a second pass, essentially final. Every line needs at least one `%` for spacing.                                                                                                            | README, "Why is there a %% at the end of every line?" |
| 28  | What happens to a `.tex.repeat` after review?             | Delete it.                                                                                                                                                                                                                         | README, "Repeat translations"                         |
| 29  | Which source editions?                                    | The BHS edition standard in 2012–2015 classes (the fifth, 1997). The unabridged HALOT is the two-volume study edition, bought in February 2014 with a BYU ORCA research grant; the default `\halot` is Holladay's concise lexicon. | README, "Quotations from HALOT"; this log             |
| 30  | Rebuild and commit `bible.pdf` with every content change? | Yes, and drop the Makefile.                                                                                                                                                                                                        | `CONTRIBUTING.md`; `pdf_committed` CI job (!110)      |
| 31  | Keep `paginate.pl`, delete `translate-character.pl`?      | Yes. One-off migrations like it can be done by hand when needed.                                                                                                                                                                   | !110; README, "Adding a chapter"                      |
| 32  | Should mdformat skip the README?                          | No: reformat it once so it fits the standard.                                                                                                                                                                                      | The README, reformatted in this change                |
| 33  | Does anyone else know the text?                           | Only the author. Professor Steven D. Ricks read nearly all of it during classes.                                                                                                                                                   | This log                                              |

Doc gaps closed without a question: the handwritten notation (`docs/digitizing.md`), CI and linting (`CONTRIBUTING.md`, !109), and why `xxxx` exists (README, "TODO work").

## Proposals

Ranked by payoff over effort. Issues already filed in this session (#28, #70, #104 through #108) aren't repeated except where noted.

### P1. Add hyperref: bookmarks, links, and PDF metadata

- **What and why:** `bible.tex` doesn't load `hyperref`, so the 320-page PDF has no bookmarks, the table of contents and `\ref`s aren't clickable, and the PDF has no title or author. Book and chapter bookmarks are the single biggest improvement to reading it on a screen, and a print edition still wants the metadata.
- **Effort:** small. Load `hyperref` last (with `bookmark`), set `pdftitle` and `pdfauthor`, and give `\book` and `\heading` bookmark entries. Watch for clashes with the `\verse` and `\heading` macros, and hide link boxes.
- **Confidence:** high. It would change if the print workflow needed a link-free PDF (a `draft` or `hidelinks` option covers that).
- **Recommendation:** file it.

### P2. Body font, with real small caps (#28 and #92)

Already filed. The sample comparison is in progress. A print edition favors a free font that allows embedding, which every candidate does.

### P3. Verse-keyed footnotes (#70, #99, #50)

Already filed and Present. It's the highest-payoff item here: faster, stable builds, and an end to force mode, with the CI log check in !106 as the safety net until then.

### P4. Warn about chapter files that aren't included

- **What and why:** nothing notices a `Book/N.tex` missing from `bible.tex`. A small CI check (or a line in `paginate.pl`'s reminder) could list every chapter file that has a translated verse but no `\input`, and every `\input` (commented or not) whose file doesn't exist. `Genesis/37` and `Leviticus/26` are commented out with no file behind them.
- **Effort:** small. **Confidence:** medium; it depends on how often chapters get added.
- **Recommendation:** backlog.

### P5. Convert the old `:` notation to `\pa`/`\pb`

- **What and why:** `Isaiah/2.tex` (2:1–10), `Zephaniah/1.tex`, and a line of `Isaiah/1.tex` (1:24) still use `:` as a tab, an early draft notation. It prints literally, and it's about 33 of the remaining ChkTeX warnings (#108).
- **Effort:** small, but it's the author's line breaks, so Present. **Confidence:** high.
- **Recommendation:** fold into #108.

### P6. The committed PDF grows the repository

- **What and why:** reopening the decision from question 30 with one new argument. `bible.pdf` has been committed 496 times, and the pack is 106 MB, most of it PDF history. Every content merge now adds about 1 MB more. An alternative is to publish the PDF from CI (GitLab Pages, or a job artifact the README links to) and stop committing it.
- **Effort:** small. **Confidence:** low: 1 MB per merge is affordable for years, and a committed PDF is simple and works offline.
- **Recommendation:** drop, unless the repository size starts to hurt. Recorded so the trade-off is known.

### P7. Give SBL Hebrew a fallback for bold and small caps

- **What and why:** HALOT quotations put Hebrew inside `\textbf`, and SBL Hebrew has no bold or small caps, so the log warns and LaTeX falls back to regular. That's harmless, but `FakeBold` (or leaving it, deliberately) would silence the warning.
- **Effort:** small. **Confidence:** medium (fake bold Hebrew can look worse than regular).
- **Recommendation:** drop; regular-weight Hebrew in a bold gloss reads fine. Taste.

### Shorter

- **P8.** Delete the empty `questions.md`. Small; file it with the next cleanup.
- **P9.** Move the preamble out of `bible.tex` into its own file, so `bible.tex` is just the book list. Taste; backlog.
- **P10.** `\verse` overrides LaTeX's `verse` environment name. Works, so drop.
- **P11.** `paralist` and `enumitem` are both loaded. Drop; the switch would touch every chapter.
- **P12.** Fleet-wide: mdformat's `--number` zero-pads lists of ten or more (`01.`). Taste; raise in `~/.claude` if it bothers anyone.
- **P13.** Pin-bump the TeX Live image on purpose with the local TeX Live. Already the rule in `.gitlab-ci.yml`; nothing to do.
