# latexmk reruns xelatex until cross-references and the table of contents settle.
# Its settings live in .latexmkrc.
bible.pdf: *.tex */*.tex Makefile images/*
	latexmk bible.tex

clean:
	latexmk -c bible.tex
