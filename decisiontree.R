
"PassengerId:type should be integers
Survived:Survived or Not
Pclass:Class of Travel
Name:Name of Passenger
Sex:Gender
Age:Age of Passengers
SibSp:Number of Sibling/Spouse aboard
Parch:Number of Parent/Child aboard
Ticket
Fare
Cabin
Embarked:The port in which a passenger has embarked. C - Cherbourg, S - Southampton, Q = Queenstown"
titanic<-read.csv(file.choose(),header = T,sep=",")
summary(titanic)
names(titanic)
install.packages("partykit")
install.packages("CHAID",repos = "http://R-Forge.R-project.org",type="source")
library(CHAID)
library(partykit)
titanic$Survived<-as.factor(titanic$Survived)
summary(titanic$Survived)
names(titanic)
tree<-chaid(formula = Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,data=titanic)
class(titanic$Survived)




library(rpart)
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,data=titanic,method="class")
plot(fit)
text(fit)
install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(fit)
Prediction <- predict(fit, titanic, type = "class")
Prediction



hitters<-read.csv(file.choose(),sep=",",header = T)
summary(hitters)
reg.tree <- rpart(Salary ~ Years + Hits, data = hitters)
rpart.plot(reg.tree, type = 4)
reg.tree$variable.importance
install.packages("MASS")
library(MASS)
set.seed(1984)
library(rpart)
train <- sample(1:nrow(hitters), nrow(hitters)/2)
tree_baseball <- rpart(Salary ~ Hits + HmRun + Runs + RBI + Walks + Years + Errors, subset = train, data = hitters)
library(rpart.plot)
rpart.plot(tree_baseball)
tree_baseball$variable.importance


