library(lpSolve)


#maximize profit = 12$,24$
#matrix = 5 x1 + 15 x2 <= 150 (water)
#         4 x1 + 4 x2 <= 480 (CO2)
#         35 x1 + 20 x2 <= 1190 (flavor) 
# A (5,4,35: 15,4,20)
# B (15,480,1190)

objective.in = c(12,24)

const.mat = matrix( c(5,15,
                      4,4,
                      35,20), 
                    nrow = 3, byrow = TRUE)
colnames(const.mat) = (c("Strwaberry" , "Orange"))
rownames(const.mat) = c("CO2" , "Water" , "Flavor")

const.dir = c("<=",
              "<=",
              "<=")

const.rhs = c(150,
              480,
              1190)

prob = lp(direction="max", objective.in, const.mat, const.dir, const.rhs)
View(sol)

ans = prob$solution
ans

val = prob$objval
val

#____________________________________________________
#maximize profit = 12$,24$,30$
#matrix = 5 x1 + 15 x2 + 10 x3  <= 150  (water)
#         4 x1 + 4 x2 + 4 x3    <= 480  (CO2)
#         35 x1 + 20 x2 + 15 x3 <= 1190 (flavor) 
#         5 x1 + 10 x2 + 20 x3 <- 800 (time)... 5 worker 8 hour =40 hour in week, then 40 * 5 days = 200 hour then, 200 * 4 weeks = 800

# A (5,4,35,5: 15,4,20,10: 10,4,15,20)
# B (15,480,1190,800) 

objective.in = c(12,24,30)

const.mat <- matrix(c(  5,15,10, 
                        4,4,4, 
                        35,20,15, 
                        5,10,20 
                        
), nrow = 4, byrow = TRUE)
colnames(const.mat) = (c("Strwaberry" , "Orange" , "Grape"))
rownames(const.mat) = c("CO2" , "Water" , "Flavor" , "Production Time")
const.mat

const.dir = c("<=",
              "<=",
              "<=",
              "<=")

const.rhs = c(150,
              480,
              1190,
              800)


sol<-lp(direction="max", objective.in, const.mat, const.dir,const.rhs )


ans = sol$solution
ans

val = sol$objval
val
