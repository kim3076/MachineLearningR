dataset = read.csv('Social_NEtwork_Ads.csv')
dataset = dataset[, 3:5]
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split==FALSE)

training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

classifier = glm(formula = Purchased ~.,
                 family = binomial,
                 data = training_set)

prob_pred = predict(classifier, type = 'response', newdata=test_set[-3])
y_pred = ifelse(prob_pred > 0.5, 1, 0)

#Confusion matrix
cm = table(test_set[, 3], y_pred)

#Visualize
library(tidyverse)

set = training_set

     





expand.grid('Age' = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01),
            'EstimatedSalary' = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01))%>%
  mutate(prob_set=predict(classifier, type = 'response', newdata = .),
         y_grid = ifelse(prob_set > 0.5, 1, 0))%>%
  ggplot()+
  geom_point(aes(x=Age, y=EstimatedSalary, color=y_grid))+
  geom_point(data=training_set, aes(x=Age, y=EstimatedSalary,colour=as.numeric(Purchased)))

