mydata1<-Universities
mydata<-scale(mydata1[,2:7])
d<- dist(mydata, method = "euclidean") #Computing the distance matrix
d
fit<- hclust(d, method = "average") #Building the algorith #try with 'centroid'
plot(fit) # dendogram display 
groups <-cutree(fit, k=4) #cut tree into 4 cluster
#draw dendogramwithred broaders around the 4 cluster
rect.hclust(fit, k=4, border = "red")
#Attach the cluster number to uni
cluster = data.frame('Uni' = mydata1[,1],'Cluster' = groups)
View(cluster) # final report