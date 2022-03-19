
# Cost for adults and children
ticket_cost <- 90
ticket_cost_child <- 40
# List 5 of your favorite movies
movies <- c('TICK, TICK... BOOM!', 'DUNE', 'LAST NIGHT IN SOHO', 'PASSING', 'ONE SHOT')  # List 5 of your favorite movies
# How many screens does the theater have? (assume 1 per movie)
screens <- 5 
# How many seats does each theater hold
seats <- 30
# Store totals for each day
week_days <-rep(0, 7) 

current_total <- 0
total <- 0

# iterate through the week
for (d in week_days) {
  
  # Keep track of total revenue for the day
  revenue_day <- 0
  adults <- 0
  children <- 0 
  
  # iterate through the amount of screens on a particular day
  for (i in 1:screens) {
    
    # Calculate  how many adults and children are watching the movie
    adults <- sample(seats, 1)
    children <- sample(c(1:(seats-adults)), 1)
    
    
    
    # Calculate the revenue for adults and children
    revenue_adults <- adults*ticket_cost
    revenue_children <- children*ticket_cost_child
    
    
    
    
    # Calculate revenue, and add to running total for the day
    current_total <- current_total + revenue_adults + revenue_children
    
  } 
  # Save total to the corresponding day 
  total <-c (total,current_total) 
  current_total <- 0 
} 

# Save total to the corresponding day 

# Make any other chart 
barplot( total, 
         main = "Total revenue per day", 
         xlab = "Days", 
         ylab = "Revenue", 
         col = "Blue" 
) 

plot( total, 
      main = "Total revenue per day", 
      xlab = "Days", 
      ylab = "Revenue", 
      col = "green" 
) 

# Which day had the highest revenue? 
