ENTRYPOINT		:=		src/main.tex
NAME			:=		category-lecture-notes.pdf
TAG_HASH		:=		$(shell git describe --tags --always --long | tr -d '\n')


all:			version.tex
				latexmk -shell-escape -interaction=nonstopmode -halt-on-error -norc -pdflatex="xelatex %O %S" -pdf $(ENTRYPOINT) \
					&& cp $(notdir $(ENTRYPOINT:.tex=.pdf)) $(NAME)

clean:
				latexmk -C $(ENTRYPOINT)

version.tex:
				echo '\newcommand{\documentVersion}{$(TAG_HASH)}' > $@

.PHONY:			all clean version.tex
