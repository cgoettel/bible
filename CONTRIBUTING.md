# Contributing

There are so many dependencies in this work that I have had to migrate to containerized development. You are welcome to use this container for your own development. More information can be found in the [Dockerfile](Dockerfile). The minimum packages you need are:
- `texlive`
- `texlive-fonts-extra` (for the Hebrew (not Aramaic) alphabet)
- `texlive-xetex`

I have also included each of the needed fonts in `fonts/`:
- [Apparatus SIL](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ApparatusSIL) (for textual apparatus symbols)
- Estrangelo V1.1 (for Syriac)
- [SBL Greek](https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx)
- [SBL Hebrew](https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx)

## Getting started

Before you can run `make`, you need to have all of the various fonts installed. These are installed with `make install`.

Once the fonts are installed, you should be good to go to run `make`. Before making changes, please ensure that `make` works. That will prove out your initial setup.
