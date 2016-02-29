################################
#
#     Makefile appunti
#    
################################

#file di output

output = *.log appunti.aux appunti.pdf appunti.toc

# phony targets
.PHONY: cleanout, pdf, view

cleanout :
	rm -f $(output)

view:
	evince appunti.pdf

pdf: appunti.tex cleanout
	pdflatex -synctex=1 -interaction nonstopmode appunti.tex
