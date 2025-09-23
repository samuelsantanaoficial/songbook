all:
	pdflatex main.tex
	texlua songidx.lua index.sxd index.sbx
	pdflatex main.tex

clear:
	rm -f *.aux *.log *.toc *.sxd *.sbx *.ilg *.out *.sxc *.gz
	rm -f songs/*.aux

booklet:
	pdfjam --booklet true --landscape --suffix booklet --a4paper main.pdf
