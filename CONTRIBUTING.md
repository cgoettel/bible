# Contributing

## Getting started

You need a TeX distribution that includes XeTeX and `latexmk`. The project's custom fonts load straight from `fonts/`, so there's nothing to install system-wide.

### Install TeX

- **macOS**: `brew install texlive`, or [MacTeX](https://www.tug.org/mactex/).
- **Debian or Ubuntu**: `sudo apt install texlive texlive-xetex texlive-fonts-extra latexmk`. The `texlive-fonts-extra` package supplies the Hebrew (not Aramaic) alphabet.
- **Anything else**: [TeX Live](https://www.tug.org/texlive/).

### Build

From the repo root:

```sh
latexmk bible.tex
```

`latexmk` reads its settings from [`.latexmkrc`](.latexmkrc) and reruns `xelatex` until cross-references and the table of contents settle. `make` does the same thing, and `make clean` removes the build files.

Expect `latexmk` to report "Maximum runs of xelatex reached without getting stable files." Per-page footnote numbering flips footnotes near a page break between two pages on alternate passes, so the build never fully settles. `.latexmkrc` turns on force mode, so `bible.pdf` is still written. If the PDF looks wrong, check `bible.log` for a real error.

If `bible.pdf` builds, your setup is fine.

### Continuous integration

Every merge request and every push to `main` runs [`.gitlab-ci.yml`](.gitlab-ci.yml) on bible's own runner (`bible-runner` in smart-home, on deskf02; GitLab's shared runners are off):

- `build_pdf` builds the book in a digest-pinned TeX Live 2026 image and fails on a LaTeX error. Because `latexmk` exits non-zero even on success (see above), the job judges the build by `bible.log` instead. It also writes the README's page-count badge.
- `mirror_to_github` pushes `main` to [github.com/cgoettel/bible](https://github.com/cgoettel/bible).

### Linting

[`.chktexrc`](.chktexrc) tunes ChkTeX for this project's macros. LaTeX Workshop picks it up on its own; on the command line, run `chktex` from the repo root (or pass `-l .chktexrc`).

### Editor

[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) for VS Code is nice to have: it rebuilds `bible.pdf` on save using `.latexmkrc` and wires up PDF ↔ source navigation.

### Fonts

The fonts in `fonts/` are:

- [Apparatus SIL](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ApparatusSIL), for textual apparatus symbols
- [Noto Sans Syriac](https://github.com/notofonts/syriac), in its default Estrangela style, for Syriac (SIL Open Font License, in `fonts/OFL-NotoSansSyriac.txt`)
- [SBL Greek](https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx)
- [SBL Hebrew](https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx)
