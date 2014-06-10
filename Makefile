
default: pdf

pdf:
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex


clean:
	rm *.aux *.lof *.log *.lot *.pdf *.toc tex/*.aux *.bbl *.blg *.bcf

