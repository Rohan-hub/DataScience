
#Dot plot & Box plot
dotchart(WC_AT$AT, main = "Dot Plot of AT data",color = "RED")
dotchart(WC_AT$Waist, main = "Dot Plot of Waist data",color = "RED")
boxplot(WC_AT$AT,col = "RED")
boxplot(WC_AT$Waist,col = "RED")

#Scatter plot
plot(WC_AT$Waist,WC_AT$AT,main = "Scatter plot",col = "RED",col.main = "RED",col.lab = "RED",
     xlab = "Waist",ylab = "AT")
#Regression model & its summary

mymodel<-lm(AT~Waist,data = WC_AT)
summary(mymodel)

#Prediction Value
predict(mymodel,data.frame(Waist=60))
pred<-predict(mymodel)
pred

#Error
finaldata<-data.frame(WC_AT,pred,"Error" = WC_AT$AT-pred)
