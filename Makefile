# Don't use "-output-directory" because xelatex has to be run three times so it wouldn't work quite right. It's just obnoxious at that point.
bible.pdf: *.tex */*.tex Makefile images/*
	/usr/bin/xelatex -halt-on-error bible.tex
	/usr/bin/xelatex bible.tex
	/usr/bin/xelatex bible.tex

clean:
	/usr/bin/rm -f *.aux *.log *.toc

install:
	mkdir -p /usr/share/fonts/truetype/
	install -m644 fonts/SBL_grk.ttf /usr/share/fonts/truetype/
	install -m644 fonts/SBL_Hbrw.ttf /usr/share/fonts/truetype/
	install -m644 fonts/Estrangelo.ttf /usr/share/fonts/truetype/
	install -m644 fonts/AppSILR.ttf /usr/share/fonts/truetype/
