#Thermal Images Work

#Preamble
source("https://bioconductor.org/biocLite.R")
biocLite("EBImage")
install.packages("PET")
install.packages("rgdal")
install.packages("raster")
install.packages("caret")
install.packages("randomForest")
install.packages("e1071")
install.packages("devtools")
install.packages("imager")
install.packages("ggplot")
install.packages("shiny")
install.packages('rsconnect')
library(rgdal)
library(raster)
library(caret)
library(randomForest)
library(e1071)
library(EBImage)
library(PET)
library(devtools)
library(imager)
library(shiny)
setwd("~/Documents/Medical_Imaging")
options(EBImage.display = "raster")
devtools::install_github("rstudio/tensorflow")
Sys.setenv(TENSORFLOW_PYTHON="/usr/local/bin/python")
library(tensorflow)
setwd("~/tensorflow")
library(tensorflow)
sess = tf$Session()
hello <- tf$constant('Hello, TensorFlow!')
sess$run(hello)
devtools::install_github("dahtah/imager")
library(purrr)
parrots <- load.example("parrots")
plot(parrots)
runExample("01_hello")




f = "~/Documents/Medical_Imaging/0101_baseline_anterior.jpg"
img = readImage(f)
display(img)
View(img@.Data)

#Get Data about Image☝
img
str(img)
hist(img)


#Crop Image to Necessary constraints (w/o side stuff)
img2 = img[26:615,41:440,]
display(img2)

#Invert Image
img_neg = max(img) - img
display(img_neg)

#Some Linear / Gamma Correction Examples
img_comb = combine(
  img2,
  img2 + 0.3,
  img2 * 2,
  img2 ^ 0.5
)
display(img_comb, all=T)

#Example of Binary Images:
img_thresh = img2 > .56
display(img_thresh)
img_thresh

#Translation
img_translate = translate(img2, v = c(100, -50))
display(img_translate)

#Rotation
img_rotate = rotate(img2, angle = -30, bg.col = "white")
display(img_rotate)

#Scaling
img_resize = resize(img2, w = 295, h = 400)
display(img_resize)
display(img2)

#Verticle and Horizontal Reflections, and transpose
display( flip(img2) )
display( flop(img2) )
imgcol_t = transpose(img2)
display(imgcol_t)

#Filters!
w = makeBrush(size = 11, shape = 'gaussian', sigma = 2)
plot(w[(nrow(w)+1)/2, ], ylab = "w", xlab = "")
img_flo = filter2(img2, w)
display(img_flo)

w = makeBrush(size = 7, shape = 'disc', sigma = 2)
plot(w[(nrow(w)+1)/2, ], ylab = "w", xlab = "")
img_flo = filter2(img2, w)
display(img_flo)
w

#Edge Detection
w = matrix(1, nrow = 11, ncol = 11)
w[3:9,3:9] = -1.4693877551
w2<-matrix(1, nrow = 5, ncol = 5)
w2[2:4,2:4]<-0

display(img2@.Data[,,1])

imgf = filter2(img2@.Data[,,1], w)
imgf <- ifelse(imgf<mean(imgf),0,imgf)
display(imgf)
imgf = filter2(imgf, w2)
imgf <- ifelse(imgf<mean(imgf),0,imgf)
display(imgf)
hough(imgf)


View(imgf)
dim(imgf2)
imgf2[,c(1:238,375:400)]<-F
imgf2[270:320,]<-F
display(imgf2)
imgf2_rb<-imgf2[6:269,239:374]
imgf2_lb<-imgf2[321:584,239:374]
display(imgf2_rb)
display(imgf2_lb)
View(imgf2_rb)
View(imgf2_lb)
#Find largest concentration of pixels



#Some practise
w2 = matrix(1, nrow = 19, ncol = 19)
w2[7:13,7:13]= 0
w3 = diag(3)
w3[1,2]<-1
w3[1,3]<-1
w3=matrix(rep(1,9),ncol=3)
w3[2,2]<-0
w4<-matrix(0, nrow = 10, ncol = 10)
w4[3:7,3:7]<-1
w4[4:6,4:6]<-0
w5<-filter2(w4, w3)
w5=ifelse(w5<1, 0, w5)
View(w5)
View(w4)
View(w3)
w4 <- ifelse(w4==1,T,F)

#Some more practise
w3=matrix(rep(1,9),ncol=3)
w3[2,2]<-0
w4<-matrix(3, nrow = 11, ncol = 11)
w4[4:8,4:8]<-5
w4[5:7,5:7]<-3
w5<-filter2(w4, w3)
w5 <- ifelse(w5<mean(w5),0,w5)
w5<-filter2(w5, w3)
w5 <- ifelse(w5<mean(w5),0,w5)
which(w5 == max(w5), arr.ind = TRUE)

x<-matrix(c(1:41, 28), ncol = 7)
View(x)
n <- length(x)
which(x==sort(x,partial=n-1)[n-2], arr.ind=T)



imgf2_rbf = filter2(imgf2_lb, w3)
st<-which(imgf2_rbf==max(imgf2_rbf), arr.ind = T)
display(imgf2_rb)
st
View(imgf2_rbf)
text(x = st[1]-45, y = st[2], label = "X", adj = c(0,1), col = "orange", cex = 2)
st[1]-45
st[2]



#Save the present image in wd
filename = "the_name_of_your_file.jpg"
dev.print(jpeg, filename = filename , width = dim(img)[1], height = dim(img)[2])
file.size(filename)
writeImage(img, "sample.jpeg", quality = 100)


#Selecting files with common name
files = list.files(pattern = "*common_part*")
#Show said files and their size
data.frame(row.names=files, size=file.size(files))




