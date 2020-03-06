datasets::claimants
fit<-datasets::claimants
# Linear Regression
fit = lm(ATTORNEY ~ factor(CLMSEX) + factor(CLMINSUR) + factor(SEATBELT) 
         + CLMAGE + LOSS, data = claimants)
summary(fit)
plot(fit)

install.packages("aod")

#Logistic Regression

logit  = glm(ATTORNEY ~ factor(CLMSEX) + factor(CLMINSUR) + factor(SEATBELT) 
             + CLMAGE + LOSS,family = "binomial", data = claimants)
summary(logit)

#Odd ratio

exp(coef(logit))

# Confusion Matrix Table

prob = predict(logit , type = c("response"),claimants)
prob
confusion<-table(prob>0.5,claimants$ATTORNEY)
confusion

#Model Accuracy
Accuracy<-sum(diag(confusion))/sum(confusion)
Accuracy

##Roc Curve
#Extract from the fitte model object the vector of fitted probability

install.packages("pROC")

library(pROC)
roccurve<-roc(claimants$ATTORNEY ~ prob)
plot(roccurve)


