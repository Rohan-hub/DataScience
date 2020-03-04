#Hypothesis testing
n<-80
s<-40
mu<-120
x<-130
t<-(x-mu)/(s/sqrt(n))
t
p<-pt(2.23,79)
p

n<-50
s<-3
mu<-4
x<-4.6
t<-(x-mu)/(s/sqrt(n))
t

n<-50
s<-3
mu<-4
x<-6.1
t<-(x-mu)/(s/sqrt(n))
t
p<-pt(4.94,49)
p

n<-50
s<-3
mu<-4
x<-7.2
t<-(x-mu)/(s/sqrt(n))
t
p<-pt(7.54,49)
p


n<-50
s<-3
mu<-4
x<-6.5
t<-(x-mu)/(s/sqrt(n))
t

c
#one saple test
x<-c( 0.142, 0.539, 0.329, 0.691, 0.231, 0.793, 0.519, 0.392, 0.418)
t.test(x,alternative = "greater",mu=0.3)

#two sample test
x<-c(91, 87, 99, 77, 88, 91)
y<-c(101, 110, 103, 93, 99, 104)
t.test(x,y,alternative = "two.sided")

#more than two data sets
pain<-c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,6,5,8,6,6,7,6,6,7,5,6,5,5)
drug<-c(rep("A",9),rep("B",9),rep("C",9))
migraine<-data.frame(pain,drug)
plot(pain ~ drug, data=migraine)

results<-aov(pain~drug,data=migraine)
summary(results)