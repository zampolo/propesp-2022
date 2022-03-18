# Usage:
# make	# generate a pdf file from tex and bib
# make view	# exhibit pdf file
# make clean	# remove all accessory files except pdf, bib, tex, and the Makefile itself
#
# @RonaldoZampolo
# 2020.08.14

all: dvi ps pdf 

name-of-the-file = main

pdf: $(name-of-the-file).ps
	@echo "Converting ps to pdf"
	ps2pdf $(name-of-the-file).ps

ps: $(name-of-the-file).dvi
	@echo "Converting dvi to ps"
	dvips $(name-of-the-file).dvi

dvi: $(name-of-the-file).tex 
	@echo "Running latex and biber"
	latex $(name-of-the-file).tex
	biber $(name-of-the-file)
	latex $(name-of-the-file).tex
	latex $(name-of-the-file).tex

view:
	evince $(name-of-the-file).pdf &

clean:
	rm *.bbl *.bcf *.blg *.xml *.aux *.dvi *.log *.ps *.toc *.bm
