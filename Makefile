# Building is handled by latexmk, which is configured in .latexmkrc. This Makefile is just for cleaning and installing fonts.
clean:
	/usr/bin/rm -f *.aux *.log *.toc

install:
	mkdir -p /usr/share/fonts/truetype/
	install -m644 fonts/SBL_grk.ttf /usr/share/fonts/truetype/
	install -m644 fonts/SBL_Hbrw.ttf /usr/share/fonts/truetype/
	install -m644 fonts/Estrangelo.ttf /usr/share/fonts/truetype/
	install -m644 fonts/AppSILR.ttf /usr/share/fonts/truetype/
