TEX = main.tex
SRC_DIR = source
BUILD_DIR = build
OUTPUT_DIR = output
OUTPUT_PDF = $(OUTPUT_DIR)/同济大学思想政治理论课学生社会实践报告模板-LaTeX.pdf

.PHONY: all pdf clean

all: pdf

pdf:
	mkdir -p $(BUILD_DIR) $(OUTPUT_DIR)
	cd $(SRC_DIR) && latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=../$(BUILD_DIR) $(TEX)
	cp $(BUILD_DIR)/main.pdf $(OUTPUT_PDF)

clean:
	latexmk -C -outdir=$(BUILD_DIR) $(SRC_DIR)/$(TEX)
	rm -f $(BUILD_DIR)/*
