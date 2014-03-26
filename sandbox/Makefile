mwe.pdf: *.tex Makefile
	rm -f mwe.aux mwe.bbl mwe.blg mwe.brf mwe.lof mwe.log mwe.lot mwe.out mwe.toc
	xelatex -halt-on-error mwe.tex
	xelatex mwe.tex

clean:	rm -f mwe.aux mwe.bbl mwe.blg mwe.brf mwe.lof mwe.log mwe.lot mwe.out mwe.toc
