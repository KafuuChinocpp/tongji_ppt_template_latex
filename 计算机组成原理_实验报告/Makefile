LATEXMK := latexmk
TEX := src/main.tex
OUTDIR := build

.PHONY: all pdf clean distclean

all: pdf

pdf:
	mkdir -p $(OUTDIR)
	TEXINPUTS=src: $(LATEXMK) -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=$(OUTDIR) $(TEX)

clean:
	TEXINPUTS=src: $(LATEXMK) -c -outdir=$(OUTDIR) $(TEX)

distclean:
	TEXINPUTS=src: $(LATEXMK) -C -outdir=$(OUTDIR) $(TEX)
