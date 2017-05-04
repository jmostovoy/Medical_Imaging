#Load and view sample data
im <- load.image("0101_baseline_anterior.jpg") %>% grayscale
plot(im)

#Delete all unecessary data and show on graph
minimum <- .3
px <- im > minimum & (Xc(im) %inr% c(26,615)) & (Yc(im) %inr% c(41,448))
highlight(px)

#Set all unecessary data to a value of zero
bwint<-as.integer(px[,,1,1])
im[,,1,1]<-bwint*im[,,1,1]
plot(im)

#
d <- as.data.frame(im)
m <- sample_n(d,1e4) %>% lm(value ~ x*y,data=.) 
im.c <- im-predict(m,d)
bg <- (!threshold(im.c,"25%"))
fg <- (threshold(im.c,"75%"))
imlist(fg,bg) %>% plot(layout="row")
seed <- bg+2*fg
plot(seed)
smthg<-seed*bwint
smthg[,,1,1]<-ifelse(smthg[,,1,1]<1, 0, 1)
smthg<-bucketfill(smthg,639, 1, color=c(1),sigma=0.3)
smthg[,,1,1]<-ifelse(smthg[,,1,1]>0, 0, 1)
plot(smthg)
View(smthg[,,1,1])



get.centers <- function(img2,thr="99%")
{
  dt <- imhessian(img2) %$% { -xx*yy + xy^2 } %>% threshold(thr) %>% label
  as.data.frame(dt) %>% subset(value>0) %>% dplyr::group_by(value) %>% dplyr::summarise(mx=mean(x),my=mean(y))
}

plot(im)
get.centers(img2,"99.9%") %$% points(mx,my,col="red")

#Extra de-noising step:


#### Tests ####

#Compute determinant at scale "scale". 
hessdet <- function(im,scale=1) isoblur(im,scale) %>% imhessian %$% { scale^2*(xx*yy - xy^2) }
#Note the scaling (scale^2) factor in the determinant
plot(hessdet(im,6),main="Determinant of the Hessian at scale 1")

#Get a data.frame with results at scale 2, 3 and 4
dat <- ldply(c(2,3,4),function(scale) hessdet(im,scale) %>% as.data.frame %>% mutate(scale=scale))

#Data across scales
scales <- seq(2,20,l=10)
d.max <- llply(scales,function(scale) hessdet(im,scale)) %>% parmax
plot(d.max,main="Point-wise maximum across scales")

#Something I don't quite understand:
i.max <- llply(scales,function(scale) hessdet(im,scale)) %>% which.parmax
plot(i.max,main="Index of the point-wise maximum \n across scales")

#Label and plot the regions:
#Get a data.frame of labelled regions
labs <- d.max %>% threshold("96%") %>% label %>% as.data.frame
#Add scale indices
labs <- mutate(labs,index=as.data.frame(i.max)$value)
regs <- dplyr::group_by(labs,value) %>% dplyr::summarise(mx=mean(x),my=mean(y),scale.index=mean(index))
p <- ggplot(as.data.frame(im),aes(x,y))+geom_raster(aes(fill=value))+geom_point(data=regs,aes(mx,my,size=scale.index),pch=2,col="red")
p+scale_fill_gradient(low="black",high="white")+scale_x_continuous(expand=c(0,0))+scale_y_continuous(expand=c(0,0),trans=scales::reverse_trans())


#Convert to EBImage
img<-Image(im[,,1,1])
display(img)
mean(!img==0)
img=ifelse(img==0, mean(!img==0), img)
display(img)
im<-as.cimg(img@.Data)

#filters
w = matrix(1, nrow = 11, ncol = 11)
w[3:9,3:9] = -1.4693877551
w2<-matrix(1, nrow = 5, ncol = 5)
w2[2:4,2:4]<-0
imgf = filter2(img, w)
display(imgf)
imgf<-as.cimg(imgf@.Data)
plot(imgf*seed*bwint)
img2<-as.cimg(imgf@.Data)

#Convert 2

img2<-Image(smthg[,,1,1])
w = makeBrush(size = 11, shape = "disc", sigma = 2)
imgf2 = filter2(img2, w)
display(imgf2)
imgf2 = ifelse(imgf2<mean(imgf2), 0, imgf2)
imgf2 = ifelse(imgf2>max(imgf2)/2, 1, 0)
display(imgf2)
img2<-as.cimg(imgf2@.Data)
