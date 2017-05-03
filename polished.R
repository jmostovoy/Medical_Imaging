#Load and view sample data
im <- load.image("0101_baseline_anterior.jpg") %>% grayscale
plot(im)

#Delete all unecessary data and show on graph
minimum <- .3
px <- im > minimum & (Xc(img) %inr% c(26,615)) & (Yc(img) %inr% c(41,448))
highlight(px)

#Set all unecessary data to a value of zero
bwint<-as.integer(px[,,1,1])
im[,,1,1]<-bwint*im[,,1,1]
plot(im)

#### Tests ####

#Compute determinant at scale "scale". 
hessdet <- function(im,scale=1) isoblur(im,scale) %>% imhessian %$% { scale^2*(xx*yy - xy^2) }
#Note the scaling (scale^2) factor in the determinant
plot(hessdet(im,6),main="Determinant of the Hessian at scale 1")

#Get a data.frame with results at scale 2, 3 and 4
dat <- ldply(c(2,3,4),function(scale) hessdet(im,scale) %>% as.data.frame %>% mutate(scale=scale))
p <- ggplot(dat,aes(x,y))+geom_raster(aes(fill=value))+facet_wrap(~ scale)
p+scale_x_continuous(expand=c(0,0))+scale_y_continuous(expand=c(0,0),trans=scales::reverse_trans())

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



