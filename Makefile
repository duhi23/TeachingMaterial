setvars:
ifeq (${R_HOME},)
R_HOME= $(shell R RHOME)
endif

ifeq (${REL},1)
  R_HOME := /opt/Rpatched
endif

ifeq (${DEV},0)
  R_HOME := /opt/Rpatched
endif

R = "$(R_HOME)/bin/R"


rbio-proteomics.md: rbioc-proteomics.Rmd
	${R} --vanilla -e "library(knitr); knit('rbioc-proteomics.Rmd'); purl('rbioc-proteomics.Rmd');"


.PHONY: clean allclean

clean:
	rm -f *~
	rm -r .Rhistory

allclean:
	rm -rf cache figure
	rm -r F063721.dat-mztab.txt TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01.mzXML

