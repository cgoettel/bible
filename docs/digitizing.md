# Digitizing handwritten translations

Much of this translation was first written by hand, in classes from about 2012 to 2015, and is digitized from photos of the pages. This is the notation those pages use and how each mark becomes LaTeX. The first large batch was digitized on 2026-11-05 (!103 "feat: digitize the November 2026 handwritten translations").

## Reading the page

| On the page                                   | Meaning                                                | In LaTeX                                                           |
| --------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------ |
| One, two, or three arrows at a line's start   | Indent depth of a poetry line                          | `\pa`, `\pb`, `\pc` (deeper: `\pd`, `\pe`)                         |
| An arrow in the middle of a line              | Hemistich break                                        | `\pa`                                                              |
| A double underline (`=`) under a word         | Where the second hemistich starts (the older notation) | `\pa` before that word                                             |
| `↳` at the start of a line                    | The line wrapped on paper; it continues the line above | Nothing; join it to the previous line                              |
| A verse number in the middle of a line        | The verse starts mid-line, as in the BHS               | Keep `\verse{c:v}` on the same line; it helps the parallelism read |
| A new line marked as prose, with no indent    | Prose, not poetry                                      | `\noindent`, on a new line                                         |
| `[lit, …]`                                    | A literal reading                                      | `\lit{…}`                                                          |
| Alternatives in parentheses or with slashes   | Alternate renderings                                   | `\alt{…}`                                                          |
| Bracketed commentary                          | An editorial note                                      | `\ed{…}`                                                           |
| `i.e.` glosses                                | An explanation                                         | `\ie{…}`                                                           |
| A word in parentheses that the Hebrew implies | An understood word                                     | `\understood{…}`                                                   |
| A big X through a section                     | Already digitized                                      | Skip it                                                            |
| A swap arrow between two phrases              | Reorder them                                           | Apply the reordering                                               |
| Shorthand: `b/c`, `w/`, `y`, `ppl`, `YM/YW`   | because, with, and, people, young men and young women  | Spell it out                                                       |
| Notes in another hand (a teacher's)           | Not part of the translation                            | Drop them                                                          |

## Rules

- **Never guess at an unreadable word.** Write `xxxx` with a LaTeX comment saying what the page appears to show, and list it in the issue for that batch (for November 2026, [#106 "Confirm uncertain readings from the November 2026 digitization"](https://gitlab.com/colby.goettel/bible/-/work_items/106)).
- **Check every passage against the repo first.** Chapter files often exist with empty `\verse{c:v} %%` stubs; fill those in. Where a verse already has text, the new version goes in a `.tex.repeat` (see the README's "Repeat translations").
- **Capitalize pronouns for God** (Me, My, His), per the README, even where the page doesn't.
- **Keep the page's mix of "thy" and "you."** That's a translation choice, not a transcription one.
- **Where a page says its indentation is wrong,** re-derive it from the parallelism, mark it `xxxx`, and leave it for a check against the BHS.
- **New lines end in `%%`**, since they've been translated once.
