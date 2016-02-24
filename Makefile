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
	okular appunti.pdf

pdf: appunti.tex cleanout
	pdflatex -interaction nonstopmode appunti.tex
