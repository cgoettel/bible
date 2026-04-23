# Build with xelatex instead of pdflatex
$pdf_mode = 5;

# -halt-on-error     : fail fast on LaTeX errors
# -interaction=nonstopmode : don't prompt on errors, just fail
# -synctex=1         : build SyncTeX index for PDF ↔ source navigation in VS Code
$xelatex = 'xelatex -halt-on-error -interaction=nonstopmode -synctex=1 %O %S';
