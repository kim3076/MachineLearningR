dataset = read.csv('50_Startups.csv')


#encoding the data 
dataset$State = factor(dataset$State, levels = 
                         c('New York', 'California', 'Florida'), 
                       labels = c(1, 2, 3))

#Splitting the dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#regressor = lm(formula = Profit ~ R.D.Spend + Administration + 
#                 Marketing.Spend + State, data = dataset)

#summary(regressor)


#Since State creates dummy variables
regressor = lm(formula = Profit ~ R.D.Spend + Administration + 
                 Marketing.Spend, data = dataset)

summary(regressor)

