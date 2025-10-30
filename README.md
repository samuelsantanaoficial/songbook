# SONGBOOK
## [songs](https://songs.sourceforge.net/)
[![Download](https://img.shields.io/badge/Download-main.pdf-green)](https://github.com/samuelsantanaoficial/songbook/raw/main/main.pdf?download=1)
[![Download](https://img.shields.io/badge/Download-songidx.lua-green)](https://github.com/samuelsantanaoficial/songbook/raw/main/songidx.lua?download=1)
[![Download](https://img.shields.io/badge/Download-makefile-green)](https://github.com/samuelsantanaoficial/songbook/raw/main/makefile?download=1)

### Organização das pastas:
```
├── README.md
├── main.tex
├── songidx.lua
│   ├── songs
|   |   ├── musica-01.tex
|   |   ├── musica-02.tex
│   │   └── musica-03.tex
└── makefile
```

Arquivo makefile para facilitar a compilação:
```make
all:
	pdflatex main.tex
	texlua songidx.lua index.sxd index.sbx
	pdflatex main.tex
	rm -f *.aux *.log *.toc *.sxd *.sbx *.ilg *.out *.sxc *.gz
	rm -f songs/*.aux
	pdfjam --booklet true --landscape --suffix booklet --a4paper main.pdf

pdf:
	pdflatex main.tex
	texlua songidx.lua index.sxd index.sbx
	pdflatex main.tex

clear:
	rm -f *.aux *.log *.toc *.sxd *.sbx *.ilg *.out *.sxc *.gz
	rm -f songs/*.aux

booklet:
	pdfjam --booklet true --landscape --suffix booklet --a4paper main.pdf
```
