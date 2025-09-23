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

clear:
	rm -f *.aux *.log *.toc *.sxd *.sbx *.ilg *.out *.sxc *.gz
	rm -f songs/*.aux

booklet:
	pdfjam --booklet true --landscape --suffix booklet --a4paper main.pdf
```
### Templates:
#### main.tex
```latex
\documentclass[10pt,a5paper,openany]{book}

\usepackage{palatino}
\usepackage[outer=1.0cm,inner=1.8cm,top=1.5cm,bottom=1.3cm]{geometry}
\usepackage[portuguese]{babel}
\usepackage[colorlinks=true,linkcolor=black]{hyperref}

\usepackage{fancyhdr}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE,LO]{\small SONGBOOK}
\fancyfoot[C]{\footnotesize \copyright ~ \the\year ~ Samuel Santana da Purificação}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
\pagestyle{fancy}

\usepackage[onesongcolumn]{songs}
\renewcommand{\idxtitlefont}{\normalsize}
\renewcommand{\idxrefsfont}{\normalsize}
\setlength{\songnumwidth}{1cm}
\renewcommand{\printsongnum}[1]{\bfseries\huge #1}
\renewcommand{\stitlefont}{\bfseries\LARGE}
\renewcommand{\extendprelude}{\small\showrefs\showauthors{\songcopyright\par}}
\renewcommand{\printchord}[1]{\bfseries\normalsize#1}
\renewcommand{\clineparams}{\baselineskip=10pt}
\renewcommand{\sharpsymbol}{\#}
\renewcommand{\flatsymbol}{b}
\setlength{\cbarwidth}{1pt}
\setlength{\sbarheight}{0pt}
\renewcommand{\makepostlude}{\resettitles}
\minfrets=5

\title{\bfseries\Huge SONGBOOK \vfill}
\author{Samuel Santana da Purificação}
\date{\small\today}

\newindex{index}{index}
\indexsongsas{index}{\thepage}

\begin{document}

\maketitle
\thispagestyle{empty}

\showindex[2]{\rmfamily Índice de músicas}{index}
\thispagestyle{empty}

\begin{songs}{index}

\include{songs/...}

\end{songs}

\end{document}
```

#### music.tex
```latex
\beginsong{Título Da Música}[
	by={Artista, Compositor},
	cr={\copyright}]

\beginverse*
\nolyrics Introdução: \[C] \rep{2}
\endverse

\beginverse
\[C]Letra da musica...
\endverse

\vspace{20pt}
\gtab{C}{X32010:032010}

\endsong
```
