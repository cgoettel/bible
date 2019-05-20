bible.pdf: *.tex */*.tex Makefile images/*
	# Don't use "-output-directory" because xelatex has to be run three times so it wouldn't work quite right. It's just obnoxious at that point.
	/usr/bin/time -p sh -c '/usr/bin/xelatex -halt-on-error bible.tex;\
	/usr/bin/xelatex bible.tex;\
	/usr/bin/xelatex bible.tex;\
	/usr/bin/mv bible.pdf /home/colby/Dropbox/Public/'

clean:
	/usr/bin/rm -f *.aux *.log *.toc
