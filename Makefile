
default: pdf

pdf:
	pdflatex main.tex

clean:
	rm *.aux *.lof *.log *.lot *.out *.pdf *.toc

