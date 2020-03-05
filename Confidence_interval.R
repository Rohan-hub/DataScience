
#Confidence Interval eg
x<-1990
std<-2500
n<-140
z<-qnorm(.975)
x+(z*std/sqrt(n))
x-(z*std/sqrt(n))

x<-1990 #mean
std<-2500 #standard deviation of poulation
n<-140 #sample
z<-qnorm(.950)
x+(z*std/sqrt(n))
x-(z*std/sqrt(n))

x<-1900
std<-2500
n<-140
z<-qnorm(.995)
x+(z*std/sqrt(n))
x-(z*std/sqrt(n))

#T Dist

x<-1900
std<-2833 #sample std deviation
n<-140
t<-qt(0.975,139)
x+(t*std/sqrt(n))
x-(t*std/sqrt(n))
2500/sqrt(280)
2833/sqrt(280)

