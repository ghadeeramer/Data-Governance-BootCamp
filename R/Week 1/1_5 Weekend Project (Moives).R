# download package imager
library(imager)
#___________________________

# Cost for adults and children
ticket_cost <- 12 # the currency is Â£
ticket_cost_child <- 8 # the currency is Â£
offer_family_ticket <- 18  # the offer for one adult and one child
student_ticket <- 10 # the offer for student 
movies <- c('EnCANTO', 'BOXING DAY', 'HOUSE OF GUCCI', 'NO TIME TO DIE', 'WEST SIDE STORY','Clifford The Big Red Dog') # List 6 of your favorite movies
screens <- 5 # How many screens does the theater have? (assume 1 per movie)
seats <- 150 # How many seats does each theater hold
week_days <- rep(0, 7) # Store totals for each day
total_revenue<- 0
total <- 0
#___________________________


# iterate through the week

for (i in week_days) {
  
  
  # iterate through the amount of screens on a particular day
  for (y in 1:screens) {
    
    # Calculate how many adults and children are watching the movie
    visitors_adults <- sample(seats, 1)
    visitors_children <- sample(abs(visitors_adults-seats),1)
    
    # Calculate the revenue for adults and children
    total_revenue <- total_revenue + visitors_adults*12 + visitors_children*8
    
    
    
  }
  # Save total to the corresponding day
  total <-c (total,total_revenue)
  total_revenue <- 0
}

#___________________________

#Potential ideas to consider in advancing your code
#Add variable utility costs function which depends on how many people showed up to your theater.

total_number_tickets <- screens*seats # Number of tickets in the same time for all screens.
total_number_tickets

total_tickets_cost_adult <- total_number_tickets*ticket_cost # Number of total cost for adults tickets
total_tickets_cost_adult

total_tickets_cost_child <- total_number_tickets*ticket_cost_child # Number of total cost for children tickets
total_tickets_cost_child
#______________________________

# Calculate  how many how many people showed up to the theater.
number_of_adults <- sample(total_number_tickets, 1)
number_of_adults

number_of_children <- sample((total_number_tickets - number_of_adults),1)
number_of_children

total_number_of_people <- number_of_adults + number_of_children
total_number_of_people
#___________________________


#Add time and the ability to show multiple movies on the same screen each day 
#versus showing one movie on one screen each day.

# read image No_time_to_die from device 
file_No_time_to_die <- system.file('C:/Users/Fatimah Asiri/Desktop/No time to die.jpg',package='imager')
No_time_to_die <- load.image('No time to die.jpg')
#Show image No_time_to_die
display(No_time_to_die)
#===================================================
# read image house_of_GUCCI from device 
file_house_of_GUCCI <- system.file('C:/Users/Fatimah Asiri/Desktop/house of GUCCI.jpg',package='imager')
house_of_GUCCI <- load.image('house of GUCCI.jpg')
#Show image house_of_GUCCI 
display(house_of_GUCCI)
#===================================================
# read image west_side_story from device 
file_west_side_story <- system.file('C:/Users/Fatimah Asiri/Desktop/west side story.jpg',package='imager')
west_side_story <- load.image('west side story.jpg')
#Show image west_side_story
display(west_side_story)
#==================================================
# read image Boxing _Day from device 
file_Boxing_Day <- system.file('C:/Users/Fatimah Asiri/Desktop/Boxing Day.jpg',package='imager')
Boxing_Day <- load.image('Boxing Day.jpg')
#Show image Boxing Day 
display(Boxing_Day)
#=================================================
# read image ENCANTO from device 
file_ENCANTO <- system.file('C:/Users/Fatimah Asiri/Desktop/ENCANTO.jpg',package='imager')
ENCANTO <- load.image('ENCANTO.jpg')
#Show image ENCANTO
display(ENCANTO)
#================================================
# read image Clifford The Big Red Dog from device 
file_Clifford_The_Big_Red_Dog <- system.file('C:/Users/Fatimah Asiri/Desktop/Clifford The Big Red Dog.jpg',package='imager')
Clifford_The_Big_Red_Dog<- load.image('Clifford The Big Red Dog.jpg')
#Show image Clifford_The_Big_Red_Dog
display(Clifford_The_Big_Red_Dog)
#================================================

Time_movies<-function()
{ #Greeting 
  print("Welcome to Astrophiles Cinema, We have 5 theater to show different moives")
  
  # User can choose number of theater
  theater_number<-readline("Enter theater number :")
  theater_number<- as.numeric(theater_number)
  # User Can choose Day
  choose_day<-readline("what is  day  :")
  # assignment theater_number to theater that have 5 value 
  theater<- theater_number
  # assignment choose day  to day that have 7 value 
 
 day <- choose_day
    #if-else if conditions 
  
  if((theater==1|theater==2)&day=='Monday')
  {writeLines('  In theater 1 and 2 ,\n Can you watch HOUSE OF GUCCI \n at 8:00 , 10:30 , 13:00 , 15:30 , 18:00 , 20:30 , 23:00 , 1:30 , 4:00')
    display(house_of_GUCCI)
}else if(theater == 3 & day=='Monday')
  {print('In theater 3, Can you watch No time to die at 8:00 , 10:30 , 13:00 , 15:30 , 18:00 , 20:30 , 23:00 , 1:30 , 4:00 ')
    display(No_time_to_die)
  }else if (theater == 4 & day=='Monday')
  {print('The theater 4  can you watch  WEST SIDE STORY and BOXING DAY specific time of day ')
    {print('Can you watch WEST SIDE STORY  at 8:00 , 13:00 , 18:00 , 23:00 , 4:00')
      display(west_side_story)}
    {print('Can you watch BOXING DAY at 10:30 , 15:30, 20:30 , 1:30')
      display(Boxing_Day)}
}else if(theater == 5 & day=='Monday')
  {print('The theater 5 is prepare for Kids can you 2 movies Clifford The Big Red Dog and  ENCANTO specific time of day')
    {print('Can you watch Clifford The Big Red Dog at 8:00 , 13:00 , 18:00 , 23:00 , 4:00')
      display(Clifford_The_Big_Red_Dog)}
    {print('Can you watch movie ENCANTO at 10:30 , 15:30, 20:30 , 1:30')
      display(ENCANTO)}
  }else{print('Sorry, You should choose number of theater 1...5 and this showed on Monday ')}}

#Call Funciton
Time_movies()
#___________________________

# Offer presale tickets at a discounted rate.
# family offer : the offer apply to one adult and one child if you have 2 adult and 2 children
# you can use this offer, but if not equal you can not use it.

number_adult <- readline(prompt="Enter how many adult: ")
number_adult <- as.numeric(number_adult)
number_child <- readline(prompt="Enter how many child: ")
number_child<- as.numeric(number_child)

if(number_adult == number_child) {
  
print (paste('you can use family offer and the total price is:', number_adult*offer_family_ticket))
  
} else {
  print(paste(' you can not use family offer, the total ticket price is:',(number_adult*ticket_cost)+(number_child*ticket_cost_child)))
}

#student offer : the offer apply to student, if you have student's card you can use this offer.

student <-1
if (student == 1){
  print (paste('you can use student offer and the price is:', ticket_cost * 0.8))
  
} else {
  print(paste(' you can not use student offer, the ticket price is:', ticket_cost))
}
#___________________________

#Add fixed costs function to calculate property rent, insurance cost, and employee and manager costs.

rent <- 50000 # annual cost
insurance_cost <- 30000 # annual cost
employees_salary <- 800 # employees salary
employees <- 50 # num of employees
manger_salary <- 1600


calculate_costs <- function(){
  x <- readline(prompt='Enter how you would to calculate cost: ')
  if(x == 'monthly'){
    print(paste('The monthly cost is:',(rent/12 + insurance_cost/12 + employees_salary*employees+manger_salary),'£'))
  }else if (x == 'annual'){
    print(paste('The annual cost is:',(rent + insurance_cost + (employees_salary*employees*12)+(manger_salary*12)),'£'))
  }else if (x == 'semi-annual'){
    print(paste('The semi-annual cost is:',(rent/2 + insurance_cost/2 + (employees_salary*employees*6)+(manger_salary*6)),'£'))}}

calculate_costs()

#___________________________

#  total revenue per day
total <- total[-1]
names(total) <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
total

# Which day had the highest revenue?

paste("The highest revenue is" , max(total), "£ on" , names(which.max(total)))


#___________________________
#Put your code into a function that is easily callable and add enough
#comments to your code to make it more readable.
comment<- function(){
  cat("-variable utility costs function \ndepends on how many people showed up to the theater. Calculate  how many how many people showed up to the theater.\n")
  cat("-Add fixed cost function \n1st, call the function.
  The comment Enter how you would to calculate cost:  will appear.\n
  2nd, user enters the type of costs to be known (monthly, annual, semi-annual).\n
  If enter monthly, for example, the function will collect the annual costs and divide them by 12.
  \nThe output is The monthly cost is: 48266.6666666667 Â£
  This happens with rest of the types,with different to method of calculation\n")
  cat("-Offer function\nThis function of offer will give a discount, that applies to family 'one adult and one child ' and the other offer will give 20% discount for student\n")
  cat("-Time_movies function\n")
  cat("install package (imager) and use library (imager)\n
  use this library to can display posters of movies\n 
   Function Time_movies() is contain theater,movies and time, it's allow to user choose theater and day\n  
  if -else if conditions have theater number and day and it works according to the user's choices\n 
   Only one day Monday  has been added to clarify the idea of the function\n 
  This function have 2 output first:is showed sentences contain number of theater,name od movies and start time\n
  Second: disply Poster of Movies ")}
comment()



