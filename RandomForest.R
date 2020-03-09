install.packages("caret",dependencies = TRUE)
install.packages("randomForest")
library(randomForest)
model<-randomForest(iris$Species~.,data = iris,ntree=1000)
#View the forest result
print(model)
#Important of the variable - Lower gini
print(importance(model))
#Extract a single tree from a forest
#split var which varialble was used to split the node;
#0 if the mode is terminal
#split point where the best split is; see details for categorical predictor
#status is the node terminal (-1) or not(1)
#prediction the prediction for the node: 0 if the node is not terminal
#getTree(model)
#Prediction
pred<-predict(model,iris[,-5])
table(pred,iris$Species)
