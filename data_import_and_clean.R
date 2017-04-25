#This R doc will be for the purposes of importing and cleaning the given Medical Imaging Data

source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("EBImage")

install.packages("tm") # only need to do once
install.packages("SnowballC")
library(tm)
library(SnowballC)

setwd("~/Documents/Medical_Imaging")
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
inspect(opinions.tdm[1:10,])
findFreqTerms(opinions.tdm, lowfreq = 100, highfreq = Inf)
ft <- findFreqTerms(opinions.tdm, lowfreq = 100, highfreq = Inf)
inspect(opinions.tdm[ft,]) 
ft.tdm <- inspect(opinions.tdm[ft,])
apply(ft.tdm, 1, sum)


install.packages("pdftools")
library(pdftools)

opinions2 <- lapply(files, pdf_text)
corp <- Corpus(VectorSource(opinions2))

opinions.tdm2 <- TermDocumentMatrix(corp, control = list(removePunctuation = TRUE,
                                                         stopwords = TRUE,
                                                         tolower = TRUE,
                                                         stemming = TRUE,
                                                         removeNumbers = TRUE,
                                                         bounds = list(global = c(3, Inf)))) 

inspect(opinions.tdm2[1:10,])
opinions2 <- lapply(opinions2, function(x)gsub("(\u201c|\u201d|\u2014)","",x))
corp <- Corpus(VectorSource(opinions2))
opinions.tdm2 <- TermDocumentMatrix(corp, control = list(removePunctuation = TRUE,
                                                         stopwords = TRUE,
                                                         tolower = TRUE,
                                                         stemming = TRUE,
                                                         removeNumbers = TRUE,
                                                         bounds = list(global = c(3, Inf))))

inspect(opinions.tdm2[1:10,])
meta(corp[[1]], tag = "id") <- files[1]
for(i in seq(length(corp))){
  meta(corp[[i]], tag = "id")<- files[i]
}

