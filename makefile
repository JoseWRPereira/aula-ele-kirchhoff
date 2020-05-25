###
### Makefile - Construção do projeto: Notas de Aula de Eletricidade
###

ENTRADA_TEX=Aula
SAIDA_PDF=aula-ele-calculaOhmKirchhoff
PDF_PATH=./pdf/
FIG_PATH=./fig/

LATEX=pdflatex
PARAM=-synctex=1 -shell-escape -enable-write18 -interaction=nonstopmode

FIGS +=	\
fig-desafio.aux \
fig-circuitoSimples.aux \
fig-leiOhmGrafico.aux \
fig-noSupInf.aux \
fig-malha.aux \
fig-paralelo.aux \
fig-rSerie.aux \
fig-desafioPasso1.aux \
fig-desafioPasso2.aux \
fig-desafioPasso3.aux \
fig-desafioPasso4.aux \
fig-desafioPasso5.aux \
fig-desafioPasso6.aux \
fig-ativ1.aux \
fig-ativ2.aux \
fig-ativ3.aux

#fig-circuitoDesafioFonteCarga.aux \
fig-circuitoSimples.aux \
fig-circuitoDesafioNoSup.aux \
fig-circuitoDesafioNoInf.aux \
fig-circuitoDesafioRamoRLED.aux \
fig-circuitoDesafioRamoRL.aux \
fig-circuitoDesafioRamoFonte.aux \
fig-circuitoExemplo.aux \
fig-ativ1.aux \
fig-ativ2.aux \
fig-ativ3.aux \
fig-ativ4.aux


artigo: CLR
	evince $(PDF_PATH)$(SAIDA_PDF).pdf&

CLR: MOV clear

MOV: LATEX1
	mv -f *.pdf $(PDF_PATH)/$(SAIDA_PDF).pdf

LATEX1: LATEX0
	$(LATEX) $(PARAM) $(ENTRADA_TEX)


LATEX0: $(ENTRADA_TEX).tex $(FIGS)
	$(LATEX) $(ENTRADA_TEX)

# $@    $<
%.aux: %.tex
	$(LATEX) $(PARAM) $<
	pdftoppm -png $(@:%.aux=%.pdf) $(FIG_PATH)$(<:%.tex=%)
	mv fig*.pdf $(FIG_PATH)

#	$(LATEX) $<

clean:
clear:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.bcf
	rm -f *.blg
	rm -f *.ilg
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.nav
	rm -f *.nlo
	rm -f *.nls
	rm -f *.out
	rm -f *.pdf
	rm -f *.run.xm
	rm -f *.run.xml
	rm -f *.toc
	rm -f *.synctex.gz
	rm -f *.snm
	rm -f *~
	rm -f fig*.gnuplot
	rm -f fig*.table
