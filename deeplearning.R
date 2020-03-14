attach(concrete)
#normalize the dat
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
#normilaze the wbcd_new
concrete_norm<- as.data.frame(lapply(concrete,normalize))
 
# creat training and test data
concrete_train<-concrete_norm[1:773,]
concrete_test<-concrete_norm[774:1030,]

#Train a model on the data
#train the neuralanet model
library(neuralnet)

#Simple ANN with only a single hidden neuron

concrete_model<- neuralnet(formula = strength ~ cement + slag + ash + water + superplastic + coarseagg + fineagg + age,
                           data = concrete_train)

#Visualize the network topology
windows()
plot(concrete_model)

# Evaluating model Performance
#obtain mmodel results
model_results<- compute(concrete_model,concrete_test[1:8])
#Obtained predicted strength value
predicted_strength<-model_results$net.result
#Examine the corelation betwwen predicted and actual value
cor(predicted_strength, concrete_test$strength)

#Improving model performance
#a ore complex neural network topology with 5 hidden neurons
concrete_modeel2<-neuralnet(strength ~ cement + slag + ash + water
                            + fineagg + age, data = concrete_train, hidden = c(5,2))
#plot the network
window()
plot(concrete_modeel2)

#evalutae the result as we did before
model_results2<- compute(concrete_modeel2,concrete_test[1:8])
predicted_strength2<-model_results2$net.result
cor(predicted_strength2, concrete_test$strength)
