#Code for graphics

setwd("~/Documents/Medical_Imaging")
thermo<-read.csv("Thermography_Studies.csv", header = T)
thermo<-thermo[-c(5),]
rownames(thermo) <- 1:nrow(thermo)
View(thermo)
library(KernSmooth)
install.packages("zoo")
library(zoo)

#Standard Deviation Vectors

sdse<-c(1:15)
sdsp<-c(1:15)

for ( i in c(1:15)) {
  sdse[i]<-sd(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(((2017-i*5)+1):(2017-(i-1)*5)))])
}
sdse

for ( i in c(1:15)) {
  sdsp[i]<-sd(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(((2017-i*5)+1):(2017-(i-1)*5)))])
}
sdsp


#Mean Vectors

mse<-c(1:15)
msp<-c(1:15)

for ( i in c(1:15)) {
  mse[i]<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(((2017-i*5)+1):(2017-(i-1)*5)))])
}
mse

for ( i in c(1:15)) {
  msp[i]<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(((2017-i*5)+1):(2017-(i-1)*5)))])
}
msp


interval_se<-matrix(data=c(mse+1.96*sdse,mse, mse-1.96*sdse), nrow=3, byrow=T)
interval_sp<-matrix(data=c(msp+1.96*sdsp,msp, msp-1.96*sdsp), nrow=3, byrow=T)
View(interval_se)
View(interval_sp)

#Refined Vectors

se<-c(1:15)
sp<-c(1:15)

thermo$Sensitivity <= interval_se[1,1] & thermo$Sensitivity >= interval_se[3,1]


for ( i in c(1:15)) {
  se[16-i]<-mean(thermo$Sensitivity[
    as.logical((thermo$Sensitivity <= interval_se[1,i] & thermo$Sensitivity
                >= interval_se[3,i])*(!is.na(thermo$Sensitivity))*thermo$Year 
               %in% c(((2017-i*5)+1):(2017-(i-1)*5)))])
}
se

for ( i in c(1:15)) {
  sp[16-i]<-mean(thermo$Specificity[
    as.logical((thermo$Specificity <= interval_sp[1,i] & thermo$Specificity
                >= interval_sp[3,i] & !is.na(thermo$Specificity))*(!is.na(thermo$Specificity))*thermo$Year
                                             %in% c(((2017-i*5)+1):(2017-(i-1)*5)))])
}
sp

se
sp

years1<-c(1:15)
years2<-c(1:15)
for (i in c(1:15)) {
  years1[i]<-1938+5*i
}
for (i in c(1:15)) {
  years2[i]<- (42+5*i)%%100
}
years2[12:13]<-c("02","07")

years1<-as.character(years1)
years2<-as.character(years2)

years<-paste0(years1, "-", years2)

plot(years, se)
years
plot(se)
plot(sp)

plot(thermo$Year, thermo$Sensitivity)
plot(thermo$Year, thermo$Specificity)

length(se)
plot(seq(1942, 2012, 5),se, lwd=1.8, col="blue", type = "b")
plot(locpoly(seq(1942, 2017, 5),se, bandwidth = 5), type="l")

plot(sp[9:15], lwd=1.8, col="blue")
plot(locpoly(seq(1942, 2017, 5),sp[9:15], bandwidth = 5), type="l")


sp[10:11]<-1/2*sp[9]+1/2*sp[12]
sp

se
se[1:4]<-se[5]
se[7]<-1/2*se[6]+1/2*se[8]
se[10:11]<-1/2*se[9]+1/2*se[12]

sum(!is.na(thermo$Specificity))

se[5]<-84

117%%100

#Plotting Sensitivity and Specificity

plot(na.approx(se[5:15]),xaxt = "n", type="b", col=rgb(0,0.6,.7), ann=FALSE, lwd=2.5, ylim=c(60,100))
axis(1, at=1:11, labels=years[5:15])
lines(5:11,na.approx(sp[9:15]), col="forestgreen", type="b", lwd=2.5)
title(main="Sensitivity & Specificity of Thermography Throughout Time", col.main="forestgreen", font.main=4)
title(xlab="Year Bucket", col.lab=rgb(0,0.6,.7))
title(ylab="Sensitivity or Specificity in %", col.lab=rgb(0,0.6,.7))
lines(locpoly(1:11,na.approx(se[5:15]), bandwidth = 2.3), type="l", col=rgb(0,0.6,.7), lwd=2.5)
lines(locpoly(5:11,na.approx(sp[9:15]), bandwidth = 1.5), type="l", col="forestgreen", lwd=2.5)
legend(0.5, 98, c("Best Polynomial Approximation for Sensitivity", "Best Polynomial Approximation for Specificity"), 
       lty=c(1,1), lwd=c(2.5,2.5), col=c(rgb(0,0.6,.7),"forestgreen"),bty = "n")
legend(0.7, 72, c("Sensitivity", "Specificity"), 
       lty=c(1,1), pch=c(1, 1), lwd=c(2.5,2.5), col=c(rgb(0,0.6,.7),"forestgreen"),bty = "n")



locpoly(seq(1983, 2017, 5),na.approx(sp[9:15]), bandwidth = 4)






sen<-data.frame(thermo$Year, thermo$Sensitivity)
spe<-data.frame(thermo$Year, thermo$Specificity)

##### Time Series of Scientific Interest in Thermography #####

timethermo<-read.csv("timeline.csv", header = T)
View(timethermo)

smoothingSpline = smooth.spline(timethermo$year[2:55], timethermo$count[2:55], spar=0.5)
plot(timethermo$year[2:55],timethermo$count[2:55], type="h", col=rgb(0,0.6,.7), ann=FALSE, lwd=4.5, xaxp  = c(1960, 2015, 11))
title(main="Time Series of Scientific Interest in Thermography", col.main="forestgreen", font.main=4)
title(xlab="Year", col.lab=rgb(0,0.6,.7))
title(ylab="Number of Studies Published", col.lab=rgb(0,0.6,.7))
legend(1961, 290, c("Actual Values", "Best Fit Line"), 
       lty=c(1,1), lwd=c(2.5,2.5), col=c(rgb(0,0.6,.7),"black"),bty = "n")
lines(smoothingSpline, lwd=1.8)







c(0,0.6,.7)*255
  
  
  
  
  