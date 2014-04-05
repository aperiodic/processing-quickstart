NAME=basics
FIG1=canvas

build: $(NAME).dvi
	dvipdf $(NAME).dvi

$(FIG1).eps: $(FIG1).pdf
	convert $(FIG1).pdf $(FIG1).eps

$(NAME).dvi: $(NAME).tex $(FIG1).eps
	latex $(NAME).tex

.PHONY: clean

clean:
	rm -f $(NAME).aux $(NAME).dvi $(NAME).pdf $(NAME).log $(NAME).toc $(FIG1).eps

.PHONY: force

force:
	rm -f $(NAME).dvi && make build
