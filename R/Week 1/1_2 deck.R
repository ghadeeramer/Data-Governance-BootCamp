library(readr)
deck <- read_csv("deck.csv")

#####################################################################
###########################1nd Task##################################
#####################################################################

###(Function 1)

Shuffle <- function(deck){
  cards <- sample (nrow(deck))
  return(deck[cards,])
}


###(Function 2)

deal <- function(Shuffled,player_list,cards_num){
  Shuffled <- Shuffle(deck)
  n <- player_list
  if(length(player_list)*cards_num > nrow(Shuffled)){
    return("there are not enough cards for everyone")
  }
  else{
    for (n in player_list){
    n <- sample(1:nrow(Shuffled),size = 5, replace=FALSE)
    print(data.frame(Shuffled[n,]))}
  }
}


deal( Shuffled, c("Ghadeer","Ola", "Fatima", "Rawan", "Rawan Faez"),5)

#####################################################################
###########################2nd Task##################################
#####################################################################


###(Function 1)

Shuffle <- function(deck){
  cards <- sample (nrow(deck))
  return(deck[cards,])
}


###(Function 2)

deal <- function(Shuffled,cards_num,size_num){
  Shuffled <- Shuffle(deck)
  player <- sample(1:nrow(Shuffled),size = size_num, replace=FALSE)
  print(data.frame(Shuffled[player,]))
}

###(Function 3)

total <- function(h){
  player1sum <- sum(player1$value)
  player2sum <- sum(player2$value)
  
  
  if (player1sum > player2sum){
    print("Player 1 has more points than Player 2")
  }
  else {
    print(" Player 2 has more points than Player 1")}
}


player1 <- deal(Shuffled,5,7)
player2<- deal(Shuffled,5,7)
total()



