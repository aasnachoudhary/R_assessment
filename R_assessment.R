#Loading necessary libraries before running the code. 
library(readxl)       #To load the dataset
library(ggplot2)      #To plot using ggplot()
library(caTools)      #To use the split() function for train and test dataset
library(randomForest) #To create a random forest algorithm 
library(dplyr)        

#Loading the dataset and using head() to check if it has loaded properly. 
data <- read_excel("~/Desktop/data.xlsx")
head(data)


#Checking the data types of the attributes
sapply(data,class)


#Performing data type conversion of the attributes and checking the new data 
#types of the attributes. 
D <- transform(data, instant=as.integer(instant),
               dteday=as.Date(dteday),
               season=as.factor(season),
               holiday=as.logical(holiday), 
               yr=as.factor(yr), 
               mnth=as.factor(mnth), 
               weekday=as.factor(weekday),
               workingday=as.logical(workingday),
               weathersit=as.factor(weathersit),
               casual=as.integer(casual),
               registered=as.integer(registered),
               cnt=as.integer(cnt))
sapply(D,class)


#Performing missing/null value analysis
is.na(D)                #is.na() to check if there are any missing/null values
which(is.na(D))         #which(is.na()) to find out which values are missing 
# We find out that there are no missing values in the dataset as which(is.na(D))
#gives output integer(0). 


#Plotting monthly distribution of the total number of bikes rented (histogram)
ggplot(D, aes(x = mnth, y = cnt, fill = mnth)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Monthly Bike Rentals", x = "Month", y = "Bikes rented") +
  labs(fill = "Month") 


#Plotting yearly distribution of the total number of bikes rented (histogram)
ggplot(D,aes(x=yr, y=cnt, fill=yr)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Yearly Bike Rentals", x = "Year" , y = "Bikes rented") + 
  scale_x_discrete(labels=c("0" = "2011", "1" = "2012")) +
  labs(fill = "Year") + guides(fill = 'none')


#Plotting a boxplot for outliers' analysis
boxplot(D[,c('temp','atemp','hum','windspeed')], main="Boxplots for outliers' 
        analysis", xlab='Variables', ylab='Values')
#The boxplot clearly shows that there are some outliers in 
#both 'hum' and 'windspeed'.


#Splitting the dataset into train and test dataset
set.seed(100)
D_1 = sample.split(D,SplitRatio = 0.3)             
train = subset(D,D_1==TRUE)
test = subset(D,D_1==FALSE)
#Split ratio is 0.3 to split the dataset with 70% train and 30% test.


#Creating a model using random forest algorithm (randomForest() function)
train_features <- select(train, season, weekday, workingday, 
                         weathersit, temp, hum, windspeed)
train_rf=randomForest(train_features, train$cnt, ntree=1000, importance=TRUE)
print(train_rf)
#Here train$cnt is the target variable we want to predict and importance 
#calculates and stores variable importance scores. 
#Note: Using larger number of trees to improve the model's performance. 

#Using the random forest algorithm to predict the performance of the model on 
#the test dataset
prediction = predict(train_rf, select(test, season, weekday, workingday, 
                                      weathersit, temp, hum, windspeed))
print(prediction)
#Here, the model is provided with the features from the test set and predicts 
#the values for the target variable i.e, cnt. 


