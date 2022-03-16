"Principal Component Analysis, or PCA, is a dimensionality-reduction 
method that is often used to reduce the dimensionality of large data sets,
by transforming a large set of variables into a smaller one that still contains
most of the information in the large set.
Reducing the number of variables of a data set naturally comes at the expense of
accuracy, but the trick in dimensionality reduction is to trade a little accuracy 
for simplicity. Because smaller data sets are easier to explore and visualize and 
make analyzing data much easier and faster for machine learning algorithms without
extraneous variables to process.

So to sum up, the idea of PCA is simple — reduce the number of variables of a data set,
while preserving as much information as possible"
data("iris")
head(iris)
summary(iris)
library()
"to find principal component"
mypr<-prcomp(iris[,-5],scale=T)
"to understand use of scale"
plot(iris$Sepal.Length,iris$Sepal.Width)
plot(scale(iris$Sepal.Length),scale(iris$Sepal.Width))
mypr
summary(mypr)
plot(mypr,type="l")
biplot(mypr,scale=0)

"extract pc scores"
str(mypr)
mypr$x
iris2<-cbind(iris,mypr$x[,1:2])
head(iris2)

cor(iris[,-5],iris2[,6:7])
"End of prog"
install.packages("pls")
library(pls)
names(iris)
pcmodel<-pcr(Sepal.Length~Species+Sepal.Width+Petal.Length+Petal.Width,ncomp=3,data=iris,scale=T)
iris$pred<-predict(pcmodel,iris,ncomp = 2)
head(iris)
