library("arules")

#Asscociation Rules
library(arules)
Titanic_1<-Titanic
Titanic_1<-Titanic[,-c(1)] #removes 1st column
rules <- apriori(Titanic)
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)

#rules with rhs containing 'Survived' only
rules <- apriori(Titanic_1,parameter = list(minlen=1, supp=0.2, conf=0.5),appearance = list(rhs=c("Survived=No","Survived=Yes")
                                                                                          ,default="lhs"),control = list(verbose=F))
arules::inspect(rules)
                