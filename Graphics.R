#Code for graphics

setwd("~/Documents/Medical_Imaging")
thermo<-read.csv("Thermography_Studies.csv", header = T)
thermo<-thermo[-c(5),]
rownames(thermo) <- 1:nrow(thermo)
View(thermo)
#Means for 2010-2017
sp4<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2012:2017))])
se4<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2012:2017))])
#Means for 2006-2011
sp3<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2007:2011))])
se3<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2007:2011))])
#Means for 2002-2006
sp2<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2002:2006))])
se2<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2002:2006))])
#Means for 1998-2001
sp1<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(1998:2001))])
se1<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(1998:2001))])
#Means for <1998
sp<-c(sp1,sp2,sp3,sp4)
se<-c(se1,se2,se3,se4)

plot(c(1997, 2002, 2007, 2012),sp)
plot(se)

#Means for 2010-2017
sp6<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2013:2017))])
se6<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2013:2017))])
sp5<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2010:2012))])
se5<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2010:2012))])
sp4<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2007:2009))])
se4<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2007:2009))])
sp3<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2004:2006))])
se3<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2004:2006))])
sp2<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2001:2003))])
se2<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(2001:2003))])
sp1<-mean(thermo$Specificity[as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(1998:2000))])
se1<-mean(thermo$Sensitivity[as.logical((!is.na(thermo$Sensitivity))*thermo$Year %in% c(1998:2000))])
sp<-c(sp1,sp2,sp3,sp4, sp5, sp6)
se<-c(se1,se2,se3,se4,se5, se6)

plot(c(1998, 2001, 2004, 2007, 2010, 2013),sp)
plot(c(1998, 2001, 2004, 2007, 2010, 2013),se)



as.logical((!is.na(thermo$Specificity))*thermo$Year %in% c(2010:2017))
thermo$Specificity[as.logical(is.na(thermo$Specificity)*thermo$Year %in% c(2010:2017))]


##### Time Series of Scientific Interest in Thermography #####

timethermo<-read.csv("timeline.csv", header = T)
View(timethermo)

smoothingSpline = smooth.spline(timethermo$year[2:59], timethermo$count[2:59], spar=0.5)
plot(timethermo$year[2:59],timethermo$count[2:59], type="h", col=rgb(0,0.6,.7), ann=FALSE, lwd=4.5, xaxp  = c(1950, 2015, 13))
title(main="Time Series of Scientific Interest in Thermography", col.main="forestgreen", font.main=4)
title(xlab="Year", col.lab=rgb(0,0.6,.7))
title(ylab="Number of Studies Published", col.lab=rgb(0,0.6,.7))
legend(1950, 265, c("Actual Values", "Best Fit Line"), 
       lty=c(1,1), lwd=c(2.5,2.5), col=c(rgb(0,0.6,.7),"black"),bty = "n")
lines(smoothingSpline, lwd=1.8)
