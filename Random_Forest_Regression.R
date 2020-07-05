dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#install.packages('randomForest')
set.seed(123)
library(randomForest)
regressor = randomForest(x=dataset[1],
                         y=dataset$Salary, 
                         ntree = 30)


y_pred = predict(regressor, data.fram(Level=6.5))


library(ggplot2)
x_grid =seq(min(dataset$Level), max(dataset$Level), 0.0001)
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red') +
  geom_line(aes(x=x_grid, y=predict(regressor, newdata=data.frame(Level=x_grid))),
            color = 'blue') +
  ggtitle('Random Forest Regression') +
  xlab('Level') +
  ylab('Salary')