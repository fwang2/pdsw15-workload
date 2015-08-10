# Makefile for project

all: bbl ps pdf 

clean:
	rm -f *.ps paper.pdf *.dvi *.bbl *.blg *.log *.aux

pdf: ps
	ps2pdf paper.ps paper.pdf

ps: dvi
	#dvips -Ppdf -Pcmz -Pamz -t letter -D 600 -G0 -o paper.ps paper.dvi
	dvips -Ppdf -Pcmz -Pamz -t letter -D 600 -G0 -o paper.ps paper.dvi
	#dvips -K -G0 -t letter -o paper.ps paper

dvi: paper.tex paper.bbl bbl
	latex paper
	latex paper

bbl: refs.bib paper.tex
	latex paper
	bibtex paper
