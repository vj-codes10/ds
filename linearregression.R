height<-c(102,117,105,141,135,115,138)
weight<-c(61,46,62,54,60,69,51)
student<-lm(weight~height)
student
predict(student,data.frame(height=119),interval="confidence)
plot(student)