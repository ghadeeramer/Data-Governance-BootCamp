library(readxl)
library(ggplot2)
library(tidyverse)
library(hrbrthemes)

Diabetes_Data<-read.csv('diabetes.csv',header=TRUE)

View(Diabetes_Data)
summary(Diabetes_Data)
#Replace Values "1,0" to "True,False" in column Outcome

Diabetes_Data <- Diabetes_Data %>%
  mutate(Outcome = replace(Outcome, Outcome == 1,"True"))

Diabetes_Data <- Diabetes_Data %>%
  mutate(Outcome = replace(Outcome, Outcome == 0,"False"))

# Rename Outcome column to Result_Diabetes
colnames(Diabetes_Data)[colnames(Diabetes_Data) == "Outcome"] <- "Result_Diabetes" 

# Delete column X, X.1 from data 
Diabetes_Data<- Diabetes_Data[,!(names(Diabetes_Data) %in% c("X","X.1"))]
head(Diabetes_Data)

# Delete 10 rows that have zero's values in 4 columns(Pregnancies,BloodPressure,SkinThickness ,Insulin)
Diabetes_Data <- Diabetes_Data %>% slice(-c(80, 268, 302,338,428,437,486,591,621,699))

#  Arrange by decreasing Pregnancies
Diabetes_Data <- Diabetes_Data %>% arrange(desc(Pregnancies))

view(Diabetes_Data)

#1____________________________________________

 ggplot(Diabetes_Data, aes(Age, Pregnancies,group = Result_Diabetes)) +
  geom_boxplot(alpha=0.3,col = "#C71585"  )+
  ggtitle("Cases type")
 
#Comment:Explains result of Diabetes for cases that gave test true or false by age and times of pregnancies
# first box minimum value of times of pregnancies is 0 that for women the ages of 26 and 52
#maximum value is 17 times of pregnancies for a 47year old, lower quartiles is 2,upper quartiles is 8
#median value is 4
#Second box of cases gave result of test is false,minimum value is 0,maximum value is 12, lower quartiles is 1
#,upper quartiles is 5,miedian is 2 and outlier is 12,13
#2_____________________________________________
Diabetes_Data %>%
  filter( Result_Diabetes == "True" ) %>%
  ggplot(aes(x=Pregnancies, y=BMI)) + 
  geom_point(
    fill="#4B0082",
    shape=21,
    alpha=0.5,
    size=2,
    stroke = 1.50
  )+
  ggtitle("Diabetes and BMI ")

#Comment: Is about positve cases diabetes
#Women who didn't pregnant the BMI start from 29 to 43
#The more oregnancies and BMI is close to 30, the result diabetes is true
#we have one woman  pregnancies 17 times and BMI for her is 40

#3________________________________________________
Diabetes_Data %>%
  filter( Result_Diabetes == "True" ) %>%
  ggplot(aes(x=Glucose, y=Age)) + 
  geom_point(
    fill="#4B0082",
    shape=21,
    alpha=0.5,
    size=2,
    stroke = 1.50
  )+
  ggtitle("Level of Glucose ")

#------------------------------------------------

Diabetes_Data %>%
  filter( Result_Diabetes == "True" ) %>%
  ggplot(aes(x=Insulin, y=Age)) + 
  geom_point(
    fill="#4B0082",
    shape=21,
    alpha=0.5,
    size=2,
    stroke = 1.50
  )+
  ggtitle("Level of Insulin ")

#comment
#Is about relationship between glucose and age for positive cases of diabetes glucose and Insulin reverse relationship
#The result of diabetes gave true when glucose number is high, occurs when there is to much sugar in the blood
#this happens when your body has to little insulin. The hormone that transport glucose into blood or  if your body can't
#use insulin properly. If the body has high glucose values, then the body has low insulin values.
# Level of Glucose  -> is start from 100 to 200 for women ages between 21 and 40 
# Level of Insulin -> is start from 0 to 300 for women ages between 21 and 40




#4______________________________________

Diabetes_Data %>%
  filter( Pregnancies >= 10 ) %>%
  ggplot( aes(x=Age, y=Pregnancies)) + 
  geom_point(
    fill="#242576",
    shape=21,
    alpha=0.5,
    size=2,
    stroke = 1.50,
  )+
  ggtitle("Number of Pregnancies 10 times and more by age")

#comment 
#The relationship between the age of women who become pregnant 10 times and more
#The age starts from 30 year old for women who prgrenceis 10 times 
# 10 times prgrenceis, we find more values than others and they are all ages betwwn 30 and 64
# 13 times prgrenceis,age start from 37 and 45 and some women in age 52 and 55

