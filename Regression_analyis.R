#Regression analysis


newspaper_data<-NewspaperData
newspaper_data1<-newspaper_data[,-1]
attach(newspaper_data[,-1])
summary(newspaper_data[,-1])

dotchart(NewspaperData$daily,labels = row.names(NewspaperData$Newspaper))

boxplot(sunday,col = "dodgerblue4")
boxplot(daily,col = "dodgerblue4")
plot(daily,sunday,main = "Scatter Plot",
     col ="Dodgerblue",
     col.main = "Dodgerblue4",
     col.lab = "Dodgerblue4",
     xlab = "Daily Circulation",
     ylab = "Sunday Circulation", pch=20)

reg.model<-lm(sunday~daily,data = newspaper_data)

summary(reg.model)

#test<-data.frame(daily=c(200,250,300))
test<-data.frame(daily=c(200,250,300))
pred<-predict(reg.model,newdata = test)
pred

pred<-predict(reg.model)
pred

#Error
finaldata<-data.frame(newspaper_data,pred,"Error" = newspaper_data$sunday-pred)


