SOURCES := resume.tex resume-zh.tex
PDFS := dist/resume-en.pdf dist/resume-zh.pdf
BUILD_DIR := build
LATEX := tectonic
SOURCE_DATE_EPOCH ?= 946684800

DEPS := \
	resume.cls \
	fontawesome.sty \
	fontawesomesymbols-generic.tex \
	fontawesomesymbols-xeluatex.tex \
	fonts/fontawesome-webfont.ttf \
	fonts/NotoSansSC/NotoSansSC-Regular.otf \
	fonts/NotoSansSC/NotoSansSC-Bold.otf

export SOURCE_DATE_EPOCH

.PHONY: all clean

all: $(PDFS)

dist/resume-en.pdf: resume.tex $(DEPS)
	mkdir -p $(BUILD_DIR) dist
	$(LATEX) -X compile resume.tex --outdir $(BUILD_DIR)
	cp $(BUILD_DIR)/resume.pdf $@

dist/resume-zh.pdf: resume-zh.tex $(DEPS)
	mkdir -p $(BUILD_DIR) dist
	$(LATEX) -X compile resume-zh.tex --outdir $(BUILD_DIR)
	cp $(BUILD_DIR)/resume-zh.pdf $@

clean:
	rm -rf $(BUILD_DIR)
