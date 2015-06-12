DEPENDENCIES=*.tex */*.tex Makefile images/*
TYPESETTER=xelatex
FLAGS=-halt-on-error
# Don't use "-output-directory" because xelatex has to be run three times so it wouldn't work quite right. It's just obnoxious at that point.

bible.pdf: $(DEPENDENCIES)
	# rm -f *.aux */*.aux
	$(TYPESETTER) $(FLAGS) bible.tex
	$(TYPESETTER) bible.tex
	$(TYPESETTER) bible.tex
	mv bible.pdf /home/colby/Dropbox/Public/

clean:
	rm -f *.aux *.log *.toc
