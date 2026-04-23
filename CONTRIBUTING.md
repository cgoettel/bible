# Contributing

## Getting started

There are enough font and LaTeX dependencies in this project that the easiest way to work on it is in a container.

### Prerequisites

- [VS Code](https://code.visualstudio.com/)
- The [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension. [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) is also nice-to-have: it rebuilds `bible.pdf` automatically on save and wires up PDF ↔ source navigation.
- A container runtime that VS Code can talk to — [Docker Desktop](https://www.docker.com/products/docker-desktop/) is the most common, but [OrbStack](https://orbstack.dev/), [Podman Desktop](https://podman-desktop.io/), or Colima all work.

### With VS Code and Dev Containers

Open the repo in VS Code and pick "Reopen in Container." The [Dockerfile](Dockerfile) stacks this project's four custom fonts on top of the [`texlive/texlive`](https://hub.docker.com/r/texlive/texlive) image, so `xelatex`, `latexmk`, `make`, `git`, and `ssh` are all ready to go inside.

Once the container is up:

- If you have LaTeX Workshop installed, it'll build `bible.pdf` automatically on save using the `.latexmkrc` in the repo root.
- Otherwise, run `latexmk bible.tex` from the repo root. It runs `xelatex` as many times as it needs to settle cross-references and the TOC.

If `bible.pdf` builds, your setup is fine.

### SSH inside the container

VS Code auto-forwards your host's SSH agent socket into the container, so `git push` inside the container uses the same keys you use on your host — but only if those keys are actually loaded into the agent. If you see `Permission denied (publickey)`, your agent is empty.

One-time setup:

1. Add a block to `~/.ssh/config`:

   ```
   Host gitlab.com
       AddKeysToAgent yes
       IdentityFile ~/.ssh/id_ed25519
   ```

   Adjust `IdentityFile` to match your key. On macOS, also add `UseKeychain yes` under that block so the key persists in Keychain across reboots (this option is macOS-only — don't add it on Linux).

2. Load the key into the agent:

   - **macOS**: `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`. Stores it in Keychain; auto-loads on reboot.
   - **Linux**: `ssh-add ~/.ssh/id_ed25519`. If you get "Could not open a connection to your authentication agent," run `eval "$(ssh-agent -s)"` first. Most desktop environments (GNOME Keyring, KDE Wallet) run an agent for you at login.

To sanity-check: `ssh-add -l` on your host and inside the container should list the same keys. If the container was already running when you added the key, rebuild it — the agent socket is set at container start.

### On your host

If you'd rather install a LaTeX toolchain directly, the minimum packages are:

- `texlive`
- `texlive-fonts-extra` (for the Hebrew — not Aramaic — alphabet)
- `texlive-xetex`
- `latexmk` (usually pulled in by `texlive`, but on some distros it's a separate package)

Then `make install` to install the custom fonts, and `latexmk bible.tex` to build. The fonts in `fonts/` are:

- [Apparatus SIL](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ApparatusSIL), for textual apparatus symbols
- Estrangelo V1.1, for Syriac
- [SBL Greek](https://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx)
- [SBL Hebrew](https://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx)
