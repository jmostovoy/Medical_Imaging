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
bg <- (!threshold(im.c,"20%"))
fg <- (threshold(im.c,"76.5%"))
imlist(fg,bg) %>% plot(layout="row")
seed <- bg+2*fg
plot(seed)
smthg<-seed*bwint
smthg[,,1,1]<-ifelse(smthg[,,1,1]<1, 0, 1)
smthg<-bucketfill(smthg,639, 1, color=c(1),sigma=0.3)
smthg[,,1,1]<-ifelse(smthg[,,1,1]>0, 0, 1)
plot(smthg)
View(smthg[,,1,1])

img2<-Image(smthg[,,1,1])
w = makeBrush(size = 11, shape = "disc", sigma = 2)
imgf2 = filter2(img2, w)
display(imgf2)
imgf2 = ifelse(imgf2<mean(imgf2), 0, imgf2)
imgf2 = ifelse(imgf2>max(imgf2)/2, 1, 0)
display(imgf2)
img2<-as.cimg(imgf2@.Data)

get.centers <- function(img2,thr="99%")
{
  dt <- imhessian(img2) %$% { -xx*yy + xy^2 } %>% threshold(thr) %>% label
  as.data.frame(dt) %>% subset(value>0) %>% dplyr::group_by(value) %>% dplyr::summarise(mx=mean(x),my=mean(y))
}

plot(im)
get.centers(img2,"99.9%") %$% points(mx,my,col="red")

img2.denoised <- isoblur(img2,2)
plot(im)
get.centers(img2.denoised,"99%") %$% points(mx,my,col="red")