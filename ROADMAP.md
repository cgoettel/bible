# Roadmap

Open items only. The live list is the GitLab issue tracker.

- [Staff-engineer handover](https://gitlab.com/colby.goettel/bible/-/work_items/103) (#103): a one-session exercise in which an agent plays a staff engineer inheriting the repository. It interviews the owner for knowledge transfer, with the answers folded into the documentation, then proposes what it would do differently. Proposals are discussed before anything is filed.
- [Repo ChkTeX config](https://gitlab.com/colby.goettel/bible/-/work_items/104) (#104): a `.chktexrc` that skips the project's own macros (`\Hebrew`, `\halot`, `\vref`, and the rest), so the linter's 6,000+ warnings shrink to the ones worth reading.
- [README badges](https://gitlab.com/colby.goettel/bible/-/work_items/105) (#105): a CI job that builds the PDF on merge requests and `main`, so a "PDF build" pipeline badge means something, plus an MIT license badge and an optional page-count badge.
