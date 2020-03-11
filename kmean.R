install.packages("plyr")
library(plyr)
x <- runif(50) #generating 50 random number from uniform distribution
y <- runif(50) #generating 50 random number
data <- cbind(x,y) #Combine the colums
plot(data)
km <- kmeans(data,4) #kmean clustering 4 cluster


install.packages("animation")
library("animation")
windows()
km <- kmeans.ani(data,4)

#Scree plot
wss<-c()
for(i in 2:15) wss[i] <-sum(kmeans(data,centers = i)$withinss)
plot(1:15,wss,type = "b",xlab = "No of clusters",ylab =  "Avg distance")