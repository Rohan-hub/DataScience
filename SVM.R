#Support Vector Machine (SVM)

#divide into training and test data
letter_train<-letterdata[1:1600,]
letter_test<-letterdata[16000:20000,]

#Training a model on the data
#begin by training a simple linear SVM
library(kernlab)
letter_Classifier<-ksvm(letter~.,data = letter_train,
                        kernel = "vanilladot")
##Evaluating model performance
#predictions on testing dataset
letter_predictions<-predict(letter_Classifier, letter_test)
head(letter_predictions)

table(letter_predictions, letter_test$letter)

agreement<-letter_predictions == letter_test$letter
table(agreement)
prop.table(table(agreement))

#Improving model performancer
letter_Classifier_rbf <- ksvm(letter~.,data = letter_train,
                              kernel = "rbfdot")
letter_predictions_rbf <- predict(letter_Classifier_rbf, letter_test)
agreement_rbf <- letter_predictions_rbf == letter_test$letter


table(agreement_rbf)
prop.table(table(agreement_rbf))
