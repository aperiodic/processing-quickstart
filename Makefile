NAME=cheatsheet

build: $(NAME).dvi
	dvipdf $(NAME).dvi

$(NAME).dvi: $(NAME).tex
	latex $(NAME).tex

.PHONY: clean

clean:
	rm -f *.aux *.dvi *.pdf *.log

.PHONY: force

force:
	rm -f $(NAME).dvi && make build
