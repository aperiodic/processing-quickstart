FIRST=basics
SECOND=intermediate
THIRD=advanced
FIG1=canvas

build: $(FIRST).dvi $(SECOND).dvi $(THIRD).dvi
	dvipdf $(FIRST).dvi && dvipdf $(SECOND).dvi && dvipdf $(THIRD).dvi

$(FIG1).eps: $(FIG1).pdf
	convert $(FIG1).pdf $(FIG1).eps

$(FIRST).dvi: $(FIRST).tex $(FIG1).eps
	latex $(FIRST).tex

$(SECOND).dvi: $(SECOND).tex
	latex $(SECOND).tex

$(THIRD).dvi: $(THIRD).tex
	latex $(THIRD).tex

.PHONY: clean

clean:
	rm -f *.aux *.dvi *.log *.toc $(FIRST).pdf $(SECOND).pdf $(THIRD).pdf $(FIG1).eps

.PHONY: force

force:
	rm -f *.dvi && make build
