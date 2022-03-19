#Create a 10 sided dice.

sample(1:10, 10, replace = TRUE)

#Create a function to roll the dice 6 times.

Roll = function(n)
  {
  sample(1:10, size = n, replace = TRUE)

  }
play = Roll(6)
play

#and calculate the sum of these 6 rolls.

myturn <- sample(1:10, size = 6, replace = TRUE)
myturn

sum(myturn)



