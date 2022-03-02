# Multiple Linear Regression

# Importing the dataset

# The 1st step is setting your working directory "location of your dataset in your device"
dataset = read.csv('Boston_Housing.csv')

##View(dataset)


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)

set.seed(2)
split = sample.split(dataset$target, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE) 
test_set = subset(dataset, split == FALSE) 


View(training_set)
View(test_set)


# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = target ~ .,
               data = training_set)




# In the summary focus on the coefficients section

summary(regressor)

# To get the coefficients 
regressor$coefficients

# Predicting the Test set results
y_pred <- predict(regressor, newdata = test_set)
y_actual <- test_set$target


error <- y_pred - test_set$target 
percent_error <- abs(error)/y_pred

percent_error <- round(percent_error,2)


df_multi <- data.frame(y_pred, y_actual, error, percent_error)
View(df_multi)

