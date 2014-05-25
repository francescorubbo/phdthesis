
default: pdf

pdf:
	pdflatex main.tex

clean:
	rm *.aux *.lof *.log *.lot *.pdf *.toc tex/*.aux

