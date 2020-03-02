data("airquality")

datasets::airquality

airquality<-datasets::airquality

head(airqualit)
head(airquality,n=8)
summary(airquality)
summary(airquality$Ozone)
plot(airquality$Ozone, airquality$Wind)
plot(airquality)
plot(airquality$Ozone, type = "b") # p- pointa ,line- l, both -b ,h
plot(airquality$Ozone, xlab = 'ozone Concentration', ylab = 'No. of Instance', main = 'Ozone level in NY city', col = 'blue')

#Horizontal bar Plot
barplot(airquality$Ozone, main = 'Ozone Concentration in air', xlab = 'ozone levels', col = 'red' ,horiz = TRUE)


#Histogram plot
hist(airquality$Solar.R, main = 'Solar radiation values in air',
     xlab = 'Solar rad',
     col = 'green')


#single box plot
boxplot(airquality$Solar.R)

#multiple box plots
boxplot(airquality[,0:4], main = 'Multole box plot')

#margin of the grid(mar), 
#no of rows and columns(mfrow), 
#whether a border is to be included(bty) 
#and position of the 
#labels(las: 1 for horizontal, las: 0 for vertical)
par(mfrow=c(3,3), mar=c(2,5,2,1), las=1, bty="y")
plot(airquality$Ozone)
plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, type = "c")
plot(airquality$Ozone, type = "s")
plot(airquality$Ozone, type = "h")
barplot(airquality$Ozone, main = 'Ozone Concentration in air', xlab = 'ozone levels', col = 'red' ,horiz = TRUE)
hist(airquality$Solar.R)
boxplot(airquality$Solar.R)
boxplot(airquality[,0:4], main = 'Multole box plot')


