#Multiple Linear Regression

#Importing the dataset
dataset = read.csv('50_Startups.csv')

#Encoding Categorical Data
dataset$State = factor(dataset$State, levels = 
                         c('New York', 'California', 'Florida'), 
                       labels = c(1, 2, 3))

#Splitting the dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Profit ~ .,
               data = training_set)

#Predicting the test set results
y_pred = predict(regressor, newdata = test_set)