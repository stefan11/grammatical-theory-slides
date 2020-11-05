

#STYLE-PATH= ${HOME}/.LaTex/
STYLE-PATH= ${HOME}/Library/texmf/latex/


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


