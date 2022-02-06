library(plotly)
require(zoo)
library(zoo)
library(readr)
library(lattice)
library(tibble)

sample_carpet <- read.csv(file.choose()) # load carpet.csv file into R
sample_hardwood <- read.csv(file.choose())# load hardwood.csv file into R

attach(sample_carpet)
attach(sample_hardwood)

dim.data.frame(sample_carpet)
dim.data.frame(sample_hardwood)

NROW(sample_carpet)
NROW(sample_hardwood)

colMeans(sample_carpet)
colMeans(sample_hardwood)

plot(zoo(sample_carpet))
hist(colMeans(sample_carpet))
pairs(~X1 + X2 + X20 + X3, col = factor(sample_carpet$X1), data = sample_carpet)
boxplot(sample_carpet)

plot(zoo(sample_hardwood))
hist(colMeans(sample_hardwood))
pairs(~X1 + X2 + X20 + X3, col = factor(sample_hardwood$X1), data = sample_hardwood)
boxplot(sample_hardwood)

df1<-data.frame(sample_carpet)
df1<-data.frame(label0=unlist(df1))
df2<-data.frame(sample_hardwood)
df2<-data.frame(label1=unlist(df2))

final_data = unique((cbind(df1, df2)))
View(final_data)
write_csv(final_data,"C:/Users/hp/Desktop/carwood.csv")

shuffled_data= final_data[sample(1:nrow(final_data)), ]
write_csv(shuffled_data,"C:/Users/hp/Desktop/randcarwood.csv")

plot(zoo(shuffled_data))
boxplot(shuffled_data)
pairs(~label0 + label1, col = factor(shuffled_data$label0), data = shuffled_data)

n = nrow(shuffled_data)
trainIndex = sample(1:n, size = round(0.8*n), replace=FALSE)
train = shuffled_data[trainIndex ,]
test = shuffled_data[-trainIndex ,]

write.csv(train,"C:/Users/hp/Desktop/Trainrandcarwood80.csv")
write.csv(test,"C:/Users/hp/Desktop/Testrandcarwood20.csv")

NROW(train)
NROW(test)
