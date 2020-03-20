#Scatter plot Matrix:
pairs(Cars)

#Correaltion Matrix:
cor(Cars)

#Regression model and summary
model.car<-lm(MPG~VOL+HP+SP+WT,data = Cars)
summary(model.car)

#Multi-collinearity
library(car)
car::vif(model.car)

#Diagnostic plots
  #Residual plots,QQ-plots,Std, Residual vs Fitted
plot(model.car)

library(car)
#Residual Vs Regressors
residualPlot(model.car)

#Added Variable plots
avPlots(model.car, id.n=2, id.cex=0.7)


#QQ plots of studentized residual
qqPlot(model.car)

#Deletion Diagnostics
influenceIndexPlot(model.car) # Index plots of the influence measure