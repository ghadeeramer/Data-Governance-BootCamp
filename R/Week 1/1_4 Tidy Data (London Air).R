
library(tidyverse)
library(dplyr)


#setwd("C:/Users/Dell/Desktop")

London_Data<-read.csv('LondonAir.csv',header=TRUE)


#1- Exploring Data
summary(London_Data)
View(London_Data)

#2- split ReadingDateTime to Date and Time by using "strsplit()" 

London_Data$Date <- sapply(strsplit(as.character(London_Data$ReadingDateTime), " "), "[", 1)
London_Data$Time <- sapply(strsplit(as.character(London_Data$ReadingDateTime), " "), "[", 2)



#3- Delete column "ReadingDateTime" by Using "select()"
London_Data <- select(London_Data,-c(ReadingDateTime))



#4- Separate Date to Day, Month and Year by Using separate()
London_Data <- separate(London_Data, Date , c("Day","Month","Year"), sep = "/" )


#5- Removed NULLs values
London_Data <- na.omit(London_Data) 

#6- Checking if there is NULL value
is.null(London_Data)


# What's changed ?? 

summary(London_Data)

#7- Calculate the Average for all Value and the Avrege for each Species

summarise(London_Data, Average = mean(Value, na.rm = T))


A <- London_Data %>%
  group_by(Species) %>%
  dplyr::summarize(Avrage = mean(Value, na.rm=TRUE))

A


#8 - Calculate the Average for all Value and the Avrege for each Species

summarise(London_Data, Sum = sum(Value, na.rm = T))


B <- London_Data %>%
  group_by(Species) %>%
  dplyr::summarize(Sum = sum(Value, na.rm=TRUE))

B


#>>>>>>>>plots>>>>>>>>
p1 <- plot(London_Data$Value, London_Data$Month,
     main = 'Value by month',
     xlab = "allValue",
     ylab = "Months", type = "b")

############################## 1
NO_val <- London_Data$Species == "NO"
NO <- London_Data[NO_val,]

p2 <- plot(NO$Value, NO$Month
,main = 'Nitrogen',
xlab = "Value",
ylab = "Month", col = "Purple", type = "b")

#############################
NO2_val <- London_Data$Species == "NO2"
NO2 <- London_Data[NO2_val,]

p3 <- plot(NO2$Value, NO$Month
     ,main = 'NO2',
     xlab = "Value",
     ylab = "Month", col = "blue", type = "b")
#############################

NOX_val <- London_Data$Species == "NOX"
NOX <- London_Data[NOX_val,]

p4 <- plot(NOX$Value, NOX$Month
          ,main = 'NOX',
          xlab = "Value",
          ylab = "Month", col = "darkgreen", type = "b") 

#############################
PM10_val <- London_Data$Species == "PM10"
PM10 <- London_Data[PM10_val,]

p5 <- plot(PM10$Value, PM10$Month
           ,main = 'PM10',
           xlab = "Value",
           ylab = "Month", col = "red", type = "b")

########################################################################
