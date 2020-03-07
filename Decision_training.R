data("iris")
View(iris)
install.packages("caret")
install.packages("C50")
library(caret)
library(C50)

intraininglocal<-createDataPartition(iris$Species, p = .75, list = F)
training<-iris[intraininglocal,]
testing<-iris[-intraininglocal,]
#Model Building
model<-C5.0(training$Species~., data = training) #Trial - Boosting parameter

#Generate the model summary
summary(model)
#Predict for test data set
pred<- predict.C5.0(model, testing[,-5])
a<-table(testing$Species,pred)
View(a)
sum(diag(a))/sum(a)
plot(model)


#Bagging
acc<-c()
for (i in 1:1000) {
  print(i)
  #Data Partition
  intraininglocal<-createDataPartition(iris$Species, p = .75, list = F)
  training1<-iris[intraininglocal,]
  testing<-iris[-intraininglocal,]
  #Model Building
  fittree<-C5.0(training1$Species~., data = training1,trails = 20) #Trial - Boosting parameter
  
  #Generate the model summary
  summary(fittree)
  #Predict for test data set
  pred<- predict.C5.0(fittree, testing[,-5])
  a<-table(testing$Species,pred)
  #Accuracy
  acc<-c(acc,sum(diag(a))/sum(a))
  
}
summary(acc) 

#Boosting
#Data Partition
intraininglocal<-createDataPartition(iris$Species, p = .75, list = F)
training<-iris[intraininglocal,]
testing<-iris[-intraininglocal,]
#Model Building
model<-C5.0(training$Species~., data = training, trails = 10) #Trial - Boosting parameter

#Generate the model summary
summary(model)
#Predict for test data set
pred<- predict.C5.0(model, testing[,-5])
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)





