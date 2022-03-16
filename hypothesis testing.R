"test for normal destribution"
data1<-read.csv(file.choose(),sep=",",header = T)
shapiro.test(data1$C1)

"one sample t test"
apple<-read.csv(file.choose(),sep=",",header = T)
summary(apple)
t.test(apple$C1, alternative="greater", mu=97)

"independent t test "
time<-read.csv(file.choose(),sep=",",header = T)
summary(time)

"paired t test "
time1<-read.csv(file.choose(),sep=",",header = T)
t.test(time1$time_before,time1$time_after,alternative = "greater",paired = T)

"t test for correlation "
cor<-read.csv(file.choose(),sep=",",header = T)
summary(cor)
cor.test(cor$aptitude,cor$job_prof,alternative = "two.sided",method="pearson")

"t test for variance "
var<-read.csv(file.choose(),sep=",",header = T)
summary(var)
var.test(var$time_g1,var$time_g2,alternative = "two.sided")


