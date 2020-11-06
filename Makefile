

#STYLE-PATH= ${HOME}/.LaTex/
STYLE-PATH= ${HOME}/Library/texmf/tex/latex/


SOURCE= $(wildcard *.tex)



#${HOME}/.LaTeX/beamer-includes.sty\


#dvi: hu-formgram-vorl-slides.dvi hu-formgram-vorl-slides.bib.dvi hu-formgram-vorl-handout.dvi

slides: formgram-slides-en.pdf
handout: formgram-handout-en.pdf

%.pdf: %.tex $(SOURCE) 
	xelatex $*
	biber $*
	xelatex $*
	biber $*
	xelatex $* 

install:
	cp -p ${STYLE-PATH}Beamer/hu-beamer-includes-pdflatex.sty                                          styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/theme/beamerthemeHUBerlin.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/font/beamerfontthemehu.sty        styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/color/beamercolorthemebearHU.sty  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/inner/beamerinnerthemehui.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/outer/beamerouterthemehuo.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/beamer-movement.sty                                                      styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/forest-beamer-setup.sty                                                  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/hu-literatur-biber.tex                                                   styles/Beamer/
	cp -p ${STYLE-PATH}makros.2e.sty styles/
	cp -p ${STYLE-PATH}abbrev.sty    styles/
	cp -p ${STYLE-PATH}fixcitep.sty  styles/
	cp -p ${STYLE-PATH}de-date.sty   styles/
	cp -p ${STYLE-PATH}oneline.sty   styles/
	cp -p ${STYLE-PATH}unified-biblatex.sty          styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.bbx styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.cbx styles/
	cp -p ${STYLE-PATH}Ling/article-ex.sty           styles/
	cp -p ${STYLE-PATH}Ling/merkmalstruktur.sty      styles/
	cp -p ${STYLE-PATH}Ling/my-xspace.sty            styles/
	cp -p ${STYLE-PATH}Ling/my-ccg-ohne-colortbl.sty styles/
	cp -p ${STYLE-PATH}Ling/forest.sty               styles/



public: formgram-slides.pdf formgram-handout.pdf
	scp $? /home/stefan/public_html/PS/



o-public: formgram-slides-en.pdf formgram-handout-en.pdf 
	scp -p formgram-slides-en.pdf formgram-handout-en.pdf hpsg.hu-berlin.de:/home/stefan/public_html/PS/



clean:
	find . -name \*\.bak -exec \rm {} \;
	find . -name \*~ -exec \rm {} \;
	rm -f *.bak *.toc *.bbl *.blg *~ *.log *.aux *.*pk *.cut *.tmp *.out *.nav *.snm *.for *.aux.copy *.run.xml *.bcf


realclean: clean
	rm -f *.dvi *.ps *.pdf


