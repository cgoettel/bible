# Build with xelatex instead of pdflatex
$pdf_mode = 5;

# -halt-on-error     : fail fast on LaTeX errors
# -interaction=nonstopmode : don't prompt on errors, just fail
# -synctex=1         : build SyncTeX index for PDF ↔ source navigation in VS Code
$xelatex = 'xelatex -halt-on-error -interaction=nonstopmode -synctex=1 %O %S';

# Per-page footnote numbering (footmisc's perpage) never settles: footnotes near
# a page break flip between two pages on alternate passes. Without force mode,
# latexmk gives up and skips writing the PDF. A real LaTeX error still halts
# xelatex (-halt-on-error above), so read bible.log when a build looks wrong.
$force_mode = 1;
