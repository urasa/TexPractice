
.SUFFIXES: .tex .dvi .pdf
TEX = $(shell ls *.tex)
NAME = $(TEX:%.tex=%)
OPEN =

all: $(NAME).pdf

$(NAME).pdf: $(NAME).dvi
$(NAME).dvi: $(NAME).tex

.tex.dvi:
	platex $<

.dvi.pdf:
	dvipdfm $<

clean:
	rm $(NAME).pdf $(NAME).dvi

show:
	gv -watch $(OPEN:.tex=.pdf)&
