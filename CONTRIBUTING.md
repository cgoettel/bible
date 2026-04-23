# Contributing

## Getting started

There are enough font and LaTeX dependencies in this project that the easiest way to work on it is in a container.

### Prerequisites

- [VS Code](https://code.visualstudio.com/)
- The [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- A container runtime that VS Code can talk to — [Docker Desktop](https://www.docker.com/products/docker-desktop/) is the most common, but [OrbStack](https://orbstack.dev/), [Podman Desktop](https://podman-desktop.io/), or Colima all work

### With VS Code and Dev Containers

Open the repo in VS Code and pick "Reopen in Container." The [Dockerfile](Dockerfile) stacks this project's four custom fonts on top of the [`texlive/texlive`](https://hub.docker.com/r/texlive/texlive) image, so `xelatex`, `make`, and `git` are all ready to go inside. Run `make` once the container is up — if `bible.pdf` builds, your setup is fine.

### On your host

If you'd rather install a LaTeX toolchain directly, the minimum packages are:

- `texlive`
- `texlive-fonts-extra` (for the Hebrew — not Aramaic — alphabet)
- `texlive-xetex`

Then `make install` to install the custom fonts, and `make` to build. The fonts in `fonts/` are:

- [Apparatus SIL](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ApparatusSIL), for textual apparatus symbols
- Estrangelo V1.1, for Syriac
- [SBL Greek](https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx)
- [SBL Hebrew](https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx)
