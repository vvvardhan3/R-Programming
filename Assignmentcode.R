#Packages and libraries to be installed and read
#install.packages("plotly")
library(plotly)
require(zoo)
#install.packages("zoo")
library(zoo)
#install.packages("readr")
library(readr)
#install.packages("lattice")
library(lattice)
library(tibble)

# Read data into R
Sample_carpet <- read.csv(file.choose()) # load carpet.csv file into R
Sample_hardwood <- read.csv(file.choose())# load hardwood.csv file into R

View(Sample_carpet)
class(Sample_carpet)
View(Sample_hardwood)
class(Sample_hardwood)

attach(Sample_carpet)
attach(Sample_hardwood)

#Dimensions of Data Files
print('Dimensions of Carpet data file')
dim.data.frame(Sample_carpet)
print('Dimnensions of Hardwood data file')
dim.data.frame(Sample_hardwood)

#Observations of Data File
print('Number of Observations in Carpet data file')
NROW(Sample_carpet)
print('Number of observations in Hardwood data file')
NROW(Sample_hardwood)

#Means of each feature in Data File
print('The mean of each feature in Carpet data file')
colMeans(Sample_carpet)
print('The mean of each feature in Hardwood data file')
colMeans(Sample_hardwood)


####Visual Representation####
plot(zoo(Sample_carpet))
#Histogram for mean of data in carpet for entire data set feature wise.
hist(colMeans(Sample_carpet))
#histogram matrix for random 5 features from Carpet data-set.
pairs(~X1 + X2 + X20 + X3, col = factor(Sample_carpet$X1), data = Sample_carpet)
#Box-Plot for few random features
boxplot(Sample_carpet)

####Merging carpet.csv and hardwood.csv to create a new csv file called carwood.csv####
# inserting a new column with label 0 for carpet observations and label 1 for hardwood observations
df1<-data.frame(Sample_carpet)
df1<-data.frame(label0=unlist(df1))
df2<-data.frame(Sample_hardwood)
df2<-data.frame(label1=unlist(df2))

#Merging both data files and storing it in carwood.csv
final_data = unique((cbind(df1, df2)))
View(final_data)
write_csv(final_data,"C:/Users/hp/Desktop/carwood.csv")

#shuffling the observations randomly and creating a new file called randcarwood.csv
shuffled_data= final_data[sample(1:nrow(final_data)), ]
write_csv(shuffled_data,"C:/Users/hp/Desktop/randcarwood.csv")

#Dividing the data into Train and Test data in 80:20 ratio
n = nrow(shuffled_data)
trainIndex = sample(1:n, size = round(0.8*n), replace=FALSE)
train = shuffled_data[trainIndex ,]
test = shuffled_data[-trainIndex ,]

#Saving the data in respective files
write.csv(train,"C:/Users/hp/Desktop/Trainrandcarwood80.csv")
write.csv(test,"C:/Users/hp/Desktop/Testrandcarwood20.csv")

#code/commands and results of showing how many records in each file.
NROW(train)
NROW(test)
  