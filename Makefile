doc:
	R -e 'library(devtools);document()'

roxygenise:
	R -e 'library(roxygen2);roxygenise()'
