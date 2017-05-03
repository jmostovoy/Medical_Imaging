#### Detecting Local Mins & Maxs ####

setwd("~/Documents/Medical_Imaging")

#Example with galaxies...

#Generate some synthetic data
layout(t(1:2))
set.seed(4)
points <- rbinom(100*100,1,.001) %>% as.cimg(x=100,y=100)
blobs <- isoblur(points,5)
plot(points,main="Random points")
plot(blobs,main="Blobs")

#Look at Hessian
imhessian(blobs)

#Derivatives
Hdet <- with(imhessian(blobs),(xx*yy - xy^2))
plot(Hdet,main="Determinant of Hessian")
#Get only pixels with highest values
threshold(Hdet,"99%") %>% plot(main="Determinant: 1% highest values")

#Label said regions
lab <- threshold(Hdet,"99%") %>% label
plot(lab,main="Labelled regions")

#Extract the labels
df <- as.data.frame(lab) %>% subset(value>0)
head(df,3)

#See how many local max's
unique(df$value)

#Split the data.frame into regions, and compute the mean coordinate values in each
centers <- dplyr::group_by(df,value) %>% dplyr::summarise(mx=mean(x),my=mean(y))

#Overlay results
plot(blobs)
with(centers,points(mx,my,col="red"))

#Now add noise to the synthetic data
nblobs <- blobs+.001*imnoise(dim=dim(blobs))
plot(nblobs,main="Noisy blobs")

#Summarized commands:
get.centers <- function(im,thr="99%")
{
  dt <- imhessian(im) %$% { -xx*yy + xy^2 } %>% threshold(thr) %>% label
  as.data.frame(dt) %>% subset(value>0) %>% dplyr::group_by(value) %>% dplyr::summarise(mx=mean(x),my=mean(y))
}

plot(nblobs)
get.centers(nblobs,"99%") %$% points(mx,my,col="red")

#Extra de-noising step:
nblobs.denoised <- isoblur(nblobs,2)
plot(nblobs.denoised)
get.centers(nblobs.denoised,"99%") %$% points(mx,my,col="red")

#### Moving onto Hubble ####

#Load Example Data
hub <- load.example("hubble") %>% grayscale
plot(hub,main="Hubble Deep Field")

#First attempt (using the function defined above):
plot(hub)
get.centers(hub,"99.8%") %$% points(mx,my,col="red")
#Add blur results:
plot(hub)
isoblur(hub,5) %>% get.centers("99.8%") %$% points(mx,my,col="red")


#Multi-scale approach:
#Compute determinant at scale "scale". 
hessdet <- function(im,scale=1) isoblur(im,scale) %>% imhessian %$% { scale^2*(xx*yy - xy^2) }
#Note the scaling (scale^2) factor in the determinant
plot(hessdet(hub,1),main="Determinant of the Hessian at scale 1")

#Get a data.frame with results at scale 2, 3 and 4
dat <- ldply(c(2,3,4),function(scale) hessdet(hub,scale) %>% as.data.frame %>% mutate(scale=scale))
p <- ggplot(dat,aes(x,y))+geom_raster(aes(fill=value))+facet_wrap(~ scale)
p+scale_x_continuous(expand=c(0,0))+scale_y_continuous(expand=c(0,0),trans=scales::reverse_trans())

#Data across scales
scales <- seq(2,20,l=10)
d.max <- llply(scales,function(scale) hessdet(hub,scale)) %>% parmax
plot(d.max,main="Point-wise maximum across scales")

#Something I don't quite understand:
i.max <- llply(scales,function(scale) hessdet(hub,scale)) %>% which.parmax
plot(i.max,main="Index of the point-wise maximum \n across scales")

#Label and plot the regions:
#Get a data.frame of labelled regions
labs <- d.max %>% threshold("96%") %>% label %>% as.data.frame
#Add scale indices
labs <- mutate(labs,index=as.data.frame(i.max)$value)
regs <- dplyr::group_by(labs,value) %>% dplyr::summarise(mx=mean(x),my=mean(y),scale.index=mean(index))
p <- ggplot(as.data.frame(hub),aes(x,y))+geom_raster(aes(fill=value))+geom_point(data=regs,aes(mx,my,size=scale.index),pch=2,col="red")
p+scale_fill_gradient(low="black",high="white")+scale_x_continuous(expand=c(0,0))+scale_y_continuous(expand=c(0,0),trans=scales::reverse_trans())

#Running Example with thermo images

#Example w/ Pixsets

im <- load.image("0101_baseline_anterior.jpg") %>% grayscale
im2 <-load.image("0101_baseline_anterior2.jpg") %>% grayscale
#Select pixels with high luminance
px <- im > .3 & (Xc(img) %inr% c(26,615)) & (Yc(img) %inr% c(41,440))

plot(px)
sum(px)
mean(px)
plot(im)

#Convert to image
as.cimg(px)
plot(as.cimg(px))

#Highlight pixset on image:
plot(im)
px <- im > .3 & (Xc(img) %inr% c(26,615)) & (Yc(img) %inr% c(41,448))
highlight(px)


plot(im2)
px2 <- im2 > .3 & (Xc(im2) %inr% c(26,615)) & (Yc(im2) %inr% c(41,448))
highlight(px2)
View(im)
View(px)
plot(px)
px
img

plot(im)
plot(split_connected(px))
plot(px)




#Boundary
boundary(px) %>% plot
plot(im)
boundary(px) %>% where %$% { points(x,y,cex=.1,col="red") }

im <- im & px
plot(im)
plot(px)
dfpx<-as.data.frame(px)
View(dfpx)
View(im)

##The actual thing...

img <- load.image("0101_baseline_anterior.jpg") %>% grayscale
plot(im3)
imsub(img,x %inr% c(26,615),y %inr% c(41,440)) %>% plot


highlight(px)
get.centers(im3,"99%") %$% points(mx,my,col="red")

msk <- px.flood(parrots,100,100,sigma=.28) %>% as.cimg
plot(parrots*msk)
get.locations(im, im > .3)

View(im)


View(dfim)
View(dfpx)
dfim$x


dfim<-as.data.frame(im)
dfpx<-as.data.frame(px)
intersect<-paste0(dfim$x,dfim$y) %in% paste0(dfpx$x,dfpx$y)
intersect
bwint<-as.integer(intersect)
bwint

bwint<-as.integer(px[,,1,1])
dfim2<-dfim
dfim2$value<-dfim2$value*bwint


View(dfim2)
im3<-as.cimg(dfim2)
plot(im3)

bwint<-as.integer(px[,,1,1])
bwint
length(im[,,1,1])











