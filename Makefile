bible.pdf: *.tex */*.tex Makefile images/*
	# Don't use "-output-directory" because xelatex has to be run three times so it wouldn't work quite right. It's just obnoxious at that point.
	xelatex -halt-on-error bible.tex
	xelatex bible.tex
	xelatex bible.tex
	mv bible.pdf /home/colby/Dropbox/Public/

clean:
	rm -f *.aux *.log *.toc
