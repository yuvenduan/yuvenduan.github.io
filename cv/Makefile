# Build all CV variants.  Usage (from this folder):  make        -> build everything
#                                                     make clean  -> remove build files
# Outputs go to build/ (gitignored). The academic CV is also copied to
# ../assets/files/CV.pdf, which is what the website links to.

DOCS   := cv_academic resume_neurotech resume_aiml
DEPS   := clean_cv.cls $(wildcard shared/*.tex)
LATEXMK := latexmk -pdf -outdir=build -interaction=nonstopmode -halt-on-error -quiet

all: $(DOCS:%=build/%.pdf) ../assets/files/CV.pdf

build/%.pdf: %.tex $(DEPS)
	$(LATEXMK) $<

../assets/files/CV.pdf: build/cv_academic.pdf
	cp $< $@

clean:
	latexmk -C -outdir=build $(DOCS:%=%.tex)

.PHONY: all clean
