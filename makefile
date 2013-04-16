
.SUFFIXES: .tex .dvi .pdf
TEX = $(shell ls *.tex)
NAME = $(TEX:%.tex=%)
OPEN =

all: $(NAME:%=%.pdf)

%.pdf: %.dvi
	dvipdfm $<
%.dvi: %.tex
	platex $<

clean:
	@rm -fv *.blg
	@rm -fv *.log
	@rm -fv *.toc
	@rm -fv *.pdf
	@rm -fv *.dvi
	@rm -fv *.bbl
	@rm -fv *.orig
	@rm -fv *.aux

show:
	gv -watch $(OPEN:.tex=.pdf)&
