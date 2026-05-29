XELATEX ?= xelatex
BUILD_DIR ?= build
LOG_DIR ?= $(BUILD_DIR)/logs

XELATEX_FLAGS := -interaction=nonstopmode -halt-on-error -output-directory=$(LOG_DIR)
ROOT_AUX_FILES := *.aux *.fdb_latexmk *.fls *.log *.nav *.out *.snm *.toc *.xdv *.synctex.gz
PDF_FILES := main.pdf main_exact.pdf main_hybrid.pdf main_worldmodel.pdf main_worldmodel_gallery.pdf

.PHONY: all main clean clean-exact clean-hybrid clean-worldmodel clean-worldmodel-gallery distclean exact hybrid worldmodel worldmodel-gallery hybrid-backgrounds xelatex check-fonts

define build_tex
	@mkdir -p $(LOG_DIR)
	$(XELATEX) $(XELATEX_FLAGS) $(1).tex
	$(XELATEX) $(XELATEX_FLAGS) $(1).tex
	@cp $(LOG_DIR)/$(1).pdf $(1).pdf
endef

all: hybrid

main:
	$(call build_tex,main)

exact:
	$(call build_tex,main_exact)

hybrid:
	$(call build_tex,main_hybrid)

worldmodel:
	$(call build_tex,main_worldmodel)

worldmodel-gallery:
	$(call build_tex,main_worldmodel_gallery)

hybrid-backgrounds:
	bash scripts/make_hybrid_backgrounds.sh

xelatex:
	$(call build_tex,main)

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f $(ROOT_AUX_FILES)

clean-exact:
	@rm -f $(LOG_DIR)/main_exact.* main_exact.aux main_exact.log main_exact.nav main_exact.out main_exact.snm main_exact.toc main_exact.xdv

clean-hybrid:
	@rm -f $(LOG_DIR)/main_hybrid.* main_hybrid.aux main_hybrid.log main_hybrid.nav main_hybrid.out main_hybrid.snm main_hybrid.toc main_hybrid.xdv

clean-worldmodel:
	@rm -f $(LOG_DIR)/main_worldmodel.* main_worldmodel.aux main_worldmodel.log main_worldmodel.nav main_worldmodel.out main_worldmodel.snm main_worldmodel.toc main_worldmodel.xdv

clean-worldmodel-gallery:
	@rm -f $(LOG_DIR)/main_worldmodel_gallery.* main_worldmodel_gallery.aux main_worldmodel_gallery.log main_worldmodel_gallery.nav main_worldmodel_gallery.out main_worldmodel_gallery.snm main_worldmodel_gallery.toc main_worldmodel_gallery.xdv

distclean: clean
	@rm -f $(PDF_FILES)

check-fonts:
	bash scripts/check_fonts.sh
