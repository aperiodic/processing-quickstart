NAME=cheatsheet

build: $(NAME).dvi
	dvipdf $(NAME).dvi

$(NAME).dvi: $(NAME).tex
	latex $(NAME).tex

.PHONY: clean

clean:
	rm *.aux *.dvi *.pdf *.log

.PHONY: force

force:
	rm $(NAME).dvi && make build
