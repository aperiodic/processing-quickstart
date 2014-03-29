NAME=cheatsheet

build: $(NAME).dvi
	dvipdf $(NAME).dvi

$(NAME).dvi: $(NAME).tex
	latex $(NAME).tex

.PHONY: clean

clean:
	rm -f $(NAME).aux $(NAME).dvi $(NAME).pdf $(NAME).log

.PHONY: force

force:
	rm -f $(NAME).dvi && make build
