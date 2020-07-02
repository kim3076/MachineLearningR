#Importing dataset
dataset = read.csv('Salary_Data.csv')

#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary)


library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience, training_set)

#The lower the P_value is, the more sig. P-value is.


#Predicting the Test set result
y_pred = predict(regressor, newdata = test_set)



#Visualizing the Training set results

#install.packages('ggplot2')

library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y=training_set$Salary),
             color = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, predict(regressor, newdata = training_set)), 
            color = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of Experience') + 
  ylab('Salary')
  
  
  
  
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y=test_set$Salary),
             color = 'red') + 
  geom_line(aes(x = test_set$YearsExperience, predict(regressor, newdata = test_set)), 
            color = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of Experience') + 
  ylab('Salary')
  
  
  
  
  
  
  
  
  



