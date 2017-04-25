#This R doc will be for the purposes of importing and cleaning the given Medical Imaging Data

source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("EBImage")

install.packages("tm") # only need to do once
install.packages("SnowballC")
library(tm)
library(SnowballC)

setwd("~/Documents/Medical_Imaging/docs_for_shawn")
files <- list.files(pattern = "pdf$")
Rpdf <- readPDF(control = list(text = "-layout"))
opinions <- Corpus(URISource(files), 
                   readerControl = list(reader = Rpdf))
opinions.tdm <- TermDocumentMatrix(opinions, control = list(removePunctuation = TRUE,
                                                            stopwords = TRUE,
                                                            tolower = TRUE,
                                                            stemming = TRUE,
                                                            removeNumbers = TRUE,
                                                            bounds = list(global = c(3, Inf)))) 


