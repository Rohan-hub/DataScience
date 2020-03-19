install.packages("gdata")
install.packages("xlsx")

library(gdata)

pca<- princomp(Universities[,2:7], cor = TRUE , scores = TRUE , covmat = NULL)
summary(pca)

#transformed dataset
pca$scores

#visualize using first 2 components
plot(pca$scores[,1:2], col = "Blue", pch = 18 , cex = 0.3 , lwd = 3)
text(pca$scores[,1:2], labels = c(1:25), ces = 1)
window()

