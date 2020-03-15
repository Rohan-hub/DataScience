Amtrak<-read.csv("D:/Rstudio/Amtrak.csv")
setwd("D:/Rstudio/Amtrak.csv")
View(Amtrak) #seasonality 12 months
window()
plot(Amtrak$Ridership,type="l")
#so creating 11 dummy variable

X<-data.frame(outer(rep(month.abb,length = 120),month.abb,"==") + 0) # creating dummies for 12
View(X)

colnames(X)<-month.abb #Assigning month names
View(X)
trakdata<-cbind(Amtrak,X)
View(trakdata)
colnames(trakdata)[2]<-"Ridership"
colnames(trakdata)
trakdata["t"]<-1:120
View(trakdata)
trakdata["log_rider"]<-log(trakdata["Ridership"])
trakdata["t_square"]<-trakdata["t"]*trakdata["t"]
attach(trakdata)

#Data_Partition
train<-trakdata[1:108,]
test<-trakdata[109:120,]

#Liner model
linear_model<-lm(Ridership~t,data = train)
summary(linear_model)
linear_pred<-data.frame(predict(linear_model,interval = 'predict',newdata = test))
View(linear_pred)
rmse_linear<-sqrt(mean((test$Ridership-linear_pred$fit)^2,na.rm = T))
rmse_linear

#Exponential
expo_model<-lm(log_rider~t,data = train)
summary(expo_model)
expo_pred<-data.frame(predict(expo_model,interval = 'pred',newdata = test))
rmse_expo<-sqrt(mean((test$Ridership-exp(expo_pred$fit))^2,na.rm = T))
rmse_expo

#Quadratic
Quad_model<-lm(Ridership~t+t_square,data = train)
summary(Quad_model)
Quad_pred<-data.frame(predict(Quad_model,interval = 'predict', newdata = test))
rmse_Quad<-sqrt(mean((test$Ridership-Quad_pred$fit)^2,na.rm = T))
rmse_Quad

#Additive Seasonality
sea_add_model<-lm(Ridership~Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)
summary(sea_add_model)
sea_add_pred<-data.frame(predict(sea_add_model,newdata = test,interval = 'predict'))
rmse_sea_add<-sqrt(mean((test$Ridership-sea_add_pred$fit)^2,na.rm = T))
rmse_sea_add

#Additive Seasonality with linear
Add_sea_Linear_model<-lm(Ridership~t+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)
summary(Add_sea_Linear_model)
Add_sea_Linear_pred<-data.frame(predict(Add_sea_Linear_model,newdata = test,interval = 'predict'))
rmse_Add_sea_Linear<-sqrt(mean((test$Ridership-Add_sea_Linear_pred$fit)^2,na.rm = T))
rmse_Add_sea_Linear

#Additive Seasonality with Quadratic
Add_sea_Quad_model<-lm(Ridership~t+t_square+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)
summary(Add_sea_Quad_model)
Add_sea_Quad_pred<-data.frame(predict(Add_sea_Quad_model,newdata = test,interval = 'predict'))
rmse_Add_sea_Quad<-sqrt(mean((test$Ridership-Add_sea_Quad_pred$fit)^2,na.rm = T))
rmse_Add_sea_Quad

#Multiplicative Seasonality
multi_sea_model<-lm(log_rider~Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)
summary(multi_sea_model)
multi_sea_pred<-data.frame(predict(multi_sea_model,newdata = test,interval = 'predict'))
rmse_multi_sea<-sqrt(mean((test$Ridership-multi_sea_pred$fit)^2,na.rm = T))
rmse_multi_sea

#Multiplicative Seasonality linear trend
multi_add_sea_model<-lm(log_rider~t+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data = train)
summary(multi_add_sea_model)
multi_add_sea_pred<-data.frame(predict(multi_add_sea_model,newdata = test,interval = 'predict'))
rmse_multi_add_sea<-sqrt(mean((test$Ridership-exp(multi_add_sea_pred$fit))^2,na.rm = T))
rmse_multi_add_sea

#Preparing table on model and its Rmse values

table_rmse<-data.frame('Model'=c("rmse_linear","rmse_expo","rmse_Quad","rmse_sea_add",
                                 "rmse_Add_sea_Quad","rmse_multi_sea","rmse_multi_add_sea"),
                       'RMSE' = c(rmse_linear,rmse_expo,rmse_Quad,rmse_sea_add,rmse_Add_sea_Quad,
                                  rmse_multi_sea,rmse_multi_add_sea))
View(table_rmse)
colnames(table_rmse)<-c("Model","RMSE")
View(table_rmse)


# Additive seasonality with Quadratic has least RMSE value
new_model <- lm(Ridership~t+t_square+Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov,data=trakdata)

predict(new_model,n.ahead=1)

# Getting residuals 
resid <- residuals(new_model)
resid[1:10]
windows()
hist(resid)
windows()
acf(resid,lag.max = 10)
# By principal of parcimony we will consider lag - 1  as we have so 
# many significant lags 
# Building Autoregressive model on residuals consider lag-1 
k <- arima(resid, order=c(1,0,0))

windows()
acf(k$residuals,lag.max = 15)
pred_res<- predict(arima(k$residuals,order=c(1,0,0)),n.ahead = 120)
str(pred_res)
pred_res$pred
acf(k$residuals)
write.csv(trakdata,file="trakdata.csv",col.names = F,row.names = F)








####################### Predicting new data #############################
library(readxl)
test_data<-read_excel(file.choose("D:/Rstudio/Predict_new"),1) #Load Predict_new.xlsx
View(test_data)
pred_new<-data.frame(predict(new_model,newdata=test_data,interval = 'predict'))
View(pred_new)
pred_re<-pred_res$pred[1:12]
pred_new$fit <- pred_new$fit+pred_res$pred[1:12]
View(pred_new)

