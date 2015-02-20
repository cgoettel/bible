DEPENDENCIES=*.tex */*.tex Makefile images/*
TYPESETTER=xelatex
FLAGS=-halt-on-error

bible.pdf: $(DEPENDENCIES)
	# rm -f *.aux */*.aux
	$(TYPESETTER) $(FLAGS) bible.tex
	$(TYPESETTER) bible.tex
	$(TYPESETTER) bible.tex

clean:
	rm -f *.aux *.log *.toc
