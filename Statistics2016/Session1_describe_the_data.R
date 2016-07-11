## ----eval=F--------------------------------------------------------------
## setwd("/CSC/workshop/StatisticsInR/Statistics2016")
## # e.g. setwd("~/Downloads/StatisticsInR/Statistics2016")

## ----prompt=T------------------------------------------------------------
Life_exp<-read.csv("data/Life_expectancy_at_birth.csv",header=T)

## ----prompt=T------------------------------------------------------------
head(Life_exp)

## ----prompt=T------------------------------------------------------------
str(Life_exp)

## ----prompt=T------------------------------------------------------------
dim(Life_exp)

## ----prompt=T------------------------------------------------------------
colnames(Life_exp)

## ----prompt=T------------------------------------------------------------
summary(Life_exp)

## ------------------------------------------------------------------------
ftable(Life_exp[,c("area","gender")])

## ----prompt=T------------------------------------------------------------
plot(Life_exp$life.expectancy,ylab="Life expectancy (Years)")

## ----prompt=T,echo=F-----------------------------------------------------
plot(sort(Life_exp$life.expectancy),ylab="Life expectancy (Years)")

## ----echo=F--------------------------------------------------------------
quan_1<-quantile(c(1:nrow(Life_exp)))[2]
quan_3<-quantile(c(1:nrow(Life_exp)))[4]
plot(sort(Life_exp$life.expectancy),ylab="Life expectancy (Years)",xaxt="n")
  axis(side=1, at=c(0,quan_1,median(1:nrow(Life_exp)),quan_3,nrow(Life_exp)),
     labels=c("min","1stquantile","median","3rdquantile","max"))
  points(x=c(1,median(1:nrow(Life_exp)),nrow(Life_exp)),
         y=c(min(Life_exp$life.expectancy),
             median(Life_exp$life.expectancy),max(Life_exp$life.expectancy)),
         col="red",pch=16,cex=1.6)
  abline(h=quantile(Life_exp$life.expectancy)[c(2,4)],
         v=quantile(c(1:nrow(Life_exp)))[c(2,4)],col="pink",lwd=3,lty=2)

## ----prompt=T------------------------------------------------------------
min.life.exp<-min(Life_exp$life.expectancy)
max.life.exp<-max(Life_exp$life.expectancy)
median.life.exp<-median(Life_exp$life.expectancy)
mean.life.exp<-mean(Life_exp$life.expectancy)
c(min.life.exp, max.life.exp, median.life.exp, mean.life.exp)
range(Life_exp$life.expectancy)
quantile(Life_exp$life.expectancy)

## ---- echo=FALSE---------------------------------------------------------
boxplot(Life_exp$life.expectancy,ylab="Life expectancy (Years)")
abline(h=mean(Life_exp$life.expectancy),col="forestgreen",lwd=3)

## ----prompt=T------------------------------------------------------------
c(min.life.exp, max.life.exp)
c(median.life.exp, mean.life.exp)
quantile(Life_exp$life.expectancy)[c(2,4)]

## ---- echo=FALSE---------------------------------------------------------
par(mfrow=c(1,2))
  boxplot(Life_exp$life.expectancy,ylab="Life expectancy (Years)")
  plot(sort(Life_exp$life.expectancy),ylab="Life expectancy (Years)",xaxt="n")
  axis(side=1, at=c(0,quan_1,median(1:nrow(Life_exp)),quan_3,nrow(Life_exp)),
     labels=c("min","1stquantile","median","3rdquantile","max"))
  points(x=c(1,median(1:nrow(Life_exp)),nrow(Life_exp)),
         y=c(min(Life_exp$life.expectancy),
             median(Life_exp$life.expectancy),max(Life_exp$life.expectancy)),
         col="red",pch=16,cex=1.6)
  abline(h=quantile(Life_exp$life.expectancy)[c(2,4)],
         v=quantile(c(1:nrow(Life_exp)))[c(2,4)],col="pink",lwd=3,lty=2)
par(mfrow=c(1,1))

## ----prompt=T------------------------------------------------------------
summary(Life_exp$life.expectancy)

## ----prompt=T------------------------------------------------------------
range(Life_exp$life.expectancy)

## ----prompt=T------------------------------------------------------------
IQR(Life_exp$life.expectancy)

## ----prompt=T------------------------------------------------------------
var.life.exp<-sum((Life_exp$life.expectancy-mean.life.exp)^2)/(nrow(Life_exp)-1)
sd.life.exp<-sqrt(var.life.exp)
c(var.life.exp, sd.life.exp)

## ----prompt=T------------------------------------------------------------
var(Life_exp$life.expectancy)
sd(Life_exp$life.expectancy)

## ----prompt=T------------------------------------------------------------
hist(Life_exp$life.expectancy,breaks=10)

## ----prompt=T------------------------------------------------------------
hist(Life_exp$life.expectancy,breaks=10,freq = F)
lines(density(Life_exp$life.expectancy),col="red")


## ----echo=F--------------------------------------------------------------
par(mfrow=c(2,1))
  hist(Life_exp$life.expectancy,breaks=10,freq = F,xlim=range(Life_exp$life.expectancy))
  lines(density(Life_exp$life.expectancy),col="red",lwd=3)
  boxplot(Life_exp$life.expectancy,ylab="Life expectancy (Years)",horizontal=T, ylim=range(Life_exp$life.expectancy))
  abline(v=mean(Life_exp$life.expectancy),col="forestgreen",lwd=3)
par(mfrow=c(1,1))

## ----echo=F--------------------------------------------------------------
par(mfrow=c(2,1))
  hist(Life_exp$life.expectancy,breaks=10,freq = F,xlim=range(Life_exp$life.expectancy))
  lines(density(Life_exp$life.expectancy),col="red",lwd=3)
  boxplot(Life_exp$life.expectancy,ylab="Life expectancy (Years)",horizontal=T, ylim=range(Life_exp$life.expectancy))
  abline(v=mean(Life_exp$life.expectancy),col="forestgreen",lwd=3)
par(mfrow=c(1,1))

## ---- warning=FALSE, eval=T----------------------------------------------
#install.packages("vioplot")
library("vioplot")

## ----prompt=T------------------------------------------------------------
vioplot(Life_exp$life.expectancy,
        ylim=range(Life_exp$life.expectancy),
        horizontal = T)

## ----echo=F--------------------------------------------------------------
x <- seq(0, 100, by=1)
hx <- dbinom(x,100,0.2)
plot(x, hx, type="l", lty=2, lwd=2, col="brown4",
     xlab="x value",ylab="Density", main="Binominal distribution")


## ----echo=F--------------------------------------------------------------
x <- seq(-4, 4, length=100)
hx <- dnorm(x)
plot(x, hx, type="l", lty=2, lwd=2, col="blue4",
     xlab="x value",ylab="Density", main="pdf (probability density function) of normal distribution",xaxt='n')
axis(side=1, at=c(-4,-2,0,2,4),
     labels=c(expression(paste(-2,sigma)),expression(-sigma),expression(mu),
              expression(sigma),expression(paste(2,sigma))))


## ----echo=F--------------------------------------------------------------
x <- seq(-4, 4, length=100)
hx <- dnorm(x)
plot(x, hx, type="l", lty=2, lwd=2, col="blue4",
     xlab="x value",ylab="Density", main="Normal distribution",xaxt='n')
axis(side=1, at=c(-4,-2,0,2,4),
     labels=c(expression(paste(-2,sigma)),expression(-sigma),expression(mu),
              expression(sigma),expression(paste(2,sigma))))


## ----echo=F--------------------------------------------------------------
x <- seq(-4, 4, length=200)
hx <- dnorm(x)
plot(x, hx, type="l", lty=2, lwd=2, col="blue4",
     xlab="z score",ylab="Density", main="standardised Normal distribution",xaxt='n')
axis(side=1, at=c(-4,-2,0,2,4),
     labels=c(-2,-1,0,1,2))


## ------------------------------------------------------------------------
set.seed(2)
rnorm(10,mean=8,sd=3)

## ----echo=F--------------------------------------------------------------
set.seed(2)
data4plot<-rnorm(10,mean=8,sd=3)
data4plot_h<-dnorm(data4plot,mean=8,sd=3)
x <- seq(0,16,by=.1)
hx <- dnorm(x,mean=8,sd=3)
plot(x, hx, type="l", lty=2, lwd=2, col="blue4",
     xlab="x value",ylab="Density", main="Normal distribution",xaxt="n")
points(x=data4plot,y=data4plot_h,col="red",pch=16,cex=1.6)
axis(side=1, at=c(2,5,8,11,14),labels=c(2,5,8,11,14))

## ------------------------------------------------------------------------
dnorm(8,mean=8,sd=3)

## ----echo=F--------------------------------------------------------------
set.seed(2)
data4plot<-rnorm(10,mean=8,sd=3)
maxdensity<-dnorm(8,mean=8,sd=3)
x <- seq(0,16,by=.1)
hx <- dnorm(x,mean=8,sd=3)
plot(x, hx, type="l", lty=2, lwd=2, col="blue4",ylim=c(0,maxdensity),
     xlab="x value",ylab="Density", main="Normal distribution",xaxt="n")
axis(side=1, at=c(2,5,8,11,14),labels=c(2,5,8,11,14))
abline(h=maxdensity,v=8,col="pink",lwd=3,lty=2)


## ------------------------------------------------------------------------
pnorm(8,mean=8,sd=3)

## ----echo=F--------------------------------------------------------------
set.seed(2)
data4plot<-rnorm(10,mean=8,sd=3)
maxdensity<-dnorm(8,mean=8,sd=3)
curve(dnorm(x,8,3),xlim=c(0,16),main='Normal distribution',
      xlab="x value",ylab="Density",
      col="blue4",xaxt="n",type="l", lty=2, lwd=2)
 cord.x <- c(0,seq(0,8,0.01),8)
 cord.y <- c(0,dnorm(seq(0,8,0.01),mean=8,sd=3),0)
polygon(cord.x,cord.y,col='salmon')
axis(side=1, at=c(2,5,8,11,14),labels=c(2,5,8,11,14))


## ------------------------------------------------------------------------
qnorm(0.5,mean=8,sd=3)

