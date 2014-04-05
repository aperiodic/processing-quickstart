FIRST=basics
SECOND=intermediate
FIG1=canvas

build: $(FIRST).dvi $(SECOND).dvi
	dvipdf $(FIRST).dvi && dvipdf $(SECOND).dvi

$(FIG1).eps: $(FIG1).pdf
	convert $(FIG1).pdf $(FIG1).eps

$(FIRST).dvi: $(FIRST).tex $(FIG1).eps
	latex $(FIRST).tex

$(SECOND).dvi: $(SECOND).tex
	latex $(SECOND).tex

.PHONY: clean

clean:
	rm -f *.aux *.dvi *.log *.toc $(FIRST).pdf $(SECOND).pdf $(FIG1).eps

.PHONY: force

force:
	rm -f $(FIRST).dvi && make build
