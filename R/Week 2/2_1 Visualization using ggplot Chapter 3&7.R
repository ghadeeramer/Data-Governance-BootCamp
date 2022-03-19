
library(tidyverse)
library(ggplot2)
library(dplyr)
library(treemap)


#######################################################################
#########################   Chapter 3    ##############################
#######################################################################
#3.2.4_________________________________________
#1-Run ggplot(data = mpg). What do you see?
mpg
ggplot(data = mpg)

# 2-How many rows are in mpg? How many columns?
nrow(mpg)
ncol(mpg)

# 3-What does the drv variable describe? Read the help for ?mpg to find out.
?mpg

# 4- Make a scatterplot of hwy vs cyl.
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_point()

# 5-What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(mpg, aes(x = class, y = drv)) +
  geom_point()


#3.3.1___________________________________________________________
#1.Whats gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#Answer->> Because color=blue is argument for mapping 
#to solve
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


#2.Which variables in mpg are categorical?
mpg
#Answer- manufacturer, model, trans, drv, fl, class

#Which variables are continuous?
mpg
#Answer- displ, year, cyl, cty, hwy


#3.Map a continuous variable to color, size, and shape.
#How do these aesthetics behave differently for categorical vs. continuous variables?
# Answer- categorical
#color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class ) )
#size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class ) )
#shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class ) )

#Answer- continuous
#color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cyl ) )
#size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl ) )
#shape-error
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = cly ) )


#4.What happens if you map the same variable to multiple aesthetics?
#Answer-
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = class, color = class ) )

#5.What does the stroke aesthetic do? What shapes does it work with?
#(Hint: use ?geom_point)

#Answer-
?geom_point

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class ), shape = 21, stroke = 1  )

#6.What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)?
#Note, you’ll also need to specify x and y.

#Answer-
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = displ<5 ))

#3.5.1____________________________________________________________
#What happens if you facet on a continuous variable?
#Answer-
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy)) + 
  facet_wrap(~ displ)
#Answer-" I get as many plots as there are distinct values"


#What do the empty cells in plot with facet_grid(drv ~ cyl) mean?
#How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
#Answer-
#facet_grid(drv ~ cyl)
#The empty grids using facet_grid() compare to the above plot because there are
#no points for those combination of variables


#What plots does the following code make? What does . do?
#Answer- The above plots compare displ vs hwy but for either the drv classes
#in the rows or the cyl classes in the columns.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)


#Take the first faceted plot in this section:
#What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? 
#How might the balance change if you had a larger dataset?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#Answer->>
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class))
#facet_wrap(~ class, nrow = 2)
#The advantages of labeling the classes by different colors versus showing points
#for each combination of variables in each grid is that showing all the points 
#in one grid may be too cluttered to show especially with a large dataset


#Read ?facet_wrap. What does nrow do? What does ncol do? 
#What other options control the layout of the individual panels?
#Why doesn’t facet_grid() have nrow and ncol arguments?
#Answer->>
?facet_wrap

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow=1)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(~ class)
#Nrow establishes the number of rows to display and ncol establishes 
#the number of columns to display when plotting each facet of the variable.
#facet_grid() doesn’t have nrow and ncol options because it is the simple 
#case of facet_wrap with nrow = 1. facet_wrap allows one to better use screen space


#When using facet_grid() you should usually put the variable with more unique levels in the columns
#. Why?
#Answer-
#Because if there are many levels, you’ll have many panels in the rows which is not a good use of screen space. facet_grid()
#works well with only a few levels to break up into separate panels.

#3.6.1____________________________________________________________
# 1-What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
# line chart: geom_line(), boxplot: geom_boxplot(), histogram: geom_histogram(), area chart: geom_area()

mpg

ggplot(data = mpg)

# 2-Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)


# 3- What does show.legend = FALSE do? What happens if you remove it?
# Why do you think I used it earlier in the chapter?


# 4- What does the se argument to geom_smooth() do?
# It adds standard error bands to the lines.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth(se = TRUE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth()

# 5-  Will these two graphs look different? Why/why not?
#No. Because both geom_point() and geom_smooth() will use the same data and mappings. They will inherit those options from the ggplot() object, so the mappings don’t need to specified again.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
#By default se = TRUE:
ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))



# 6- Recreate the R code necessary to generate the following graphs.
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(group = drv), se = FALSE) +
  geom_point()

#3.7.1____________________________________________________________
# 1-What is the default geom associated with stat_summary()? How could you rewrite the previous plot to use that geom function instead of the stat function?
#answer:The default geom for stat_summary() is geom_pointrange. For geom_pointrange, the default stat is “identity”, so in order to duplicate the previous plot we need to change the stat to summary and change the min, max and midpoint to reflect the same parameters as previously.


# 2-What does geom_col() do? How is it different to geom_bar()?
#answer:Geom_bar makes the height of the bar proportional to the number of cases in each group (or if the weight aesthetic is supplied, the sum of the weights). If you want the heights of the bars to represent values in the data, use geom_col instead.

# 3- Most geoms and stats come in pairs that are almost always used in concert. Read through the documentation and make a list of all the pairs. What do they have in common?
# answer: https://ggplot2.tidyverse.org/reference/


# 4-What variables does stat_smooth() compute? What parameters control its behaviour?
# Answer: stat_smooth calculates:
# y: predicted value ymin: lower value of the confidence interval ymax: upper value of the confidence interval se: standard error
# There’s parameters such as method which determines which method is used to calculate the predictions and confidence interval, and some other arguments that are passed to that.


# 5-In our proportion bar chart, we need to set group = 1. Why? In other words what is the problem with these two graphs?

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))


#3.8.1_________________________________________________________

#1- What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

#A lot of points aren't shown here because they overlap.
#Using geom_jitter() allows you to see them all.

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()

#2- What parameters to geom_jitter() control the amount of jittering?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter(width=1)   # is controlled by width argument 


#3- Compare and contrast geom_jitter() with geom_count().

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()   #increases the size of the points when there are more overlapping points


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()  #just makes all the points visible and the same size


#4- What's the default position adjustment for geom_boxplot()? Create a visualisation of the mpg dataset that demonstrates it.

ggplot(data = mpg, mapping = aes(x = drv, y = hwy, color = class)) +
  geom_boxplot(position="dodge")   #The deault is for the boxplots to be non overlapping or dodged.

ggplot(data = mpg, mapping = aes(x = drv, y = hwy, color = class)) +
  geom_boxplot(position="identity")  #by using identity we can have them overlapping


#######################################################################
#########################   Chapter 7    ##############################
#######################################################################
#7.3.4_______________________________________________________

#1- Explore the distribution of each of the x, y, and z variables in diamonds. 
#What do you learn? Think about a diamond and how you might decide which dimension is the length, width, and depth.

ggplot( data = diamonds ) +
  geom_freqpoly(binwidth=0.1,aes(x = x ), color = "yellow") +
  geom_freqpoly(binwidth=0.1,aes(x = y ), color = "blue") +
  geom_freqpoly(binwidth=0.1,aes(x = z ), color  ="red")


#2- Explore the distribution of price. Do you discover anything unusual or surprising?
#(Hint: Carefully think about the binwidth and make sure you try a wide range of values.)

ggplot( data = diamonds , aes( x = price ) ) +
  geom_histogram()

ggplot( data = diamonds , aes( x = price ) ) +
  geom_histogram(binwidth=10) +
  coord_cartesian(xlim=c(0,2000))


#3- How many diamonds are 0.99 carat? How many are 1 carat? 
#What do you think is the cause of the difference?

diamonds %>% group_by(carat) %>% count() %>%
  ggplot() +
  geom_histogram( aes( x = carat ) ) +
  coord_cartesian(xlim=c(0,2))

filter(diamonds,carat==0.99) %>% count() 
filter(diamonds,carat==1) %>% count() 


#4- Compare and contrast coord_cartesian() vs xlim() or ylim() when zooming in on a histogram.
#What happens if you leave binwidth unset? What happens if you try and zoom so only half a bar shows?

#coord_cartesian()
diamonds %>% 
  ggplot() +
  geom_histogram( aes( x = carat ) ) +
  coord_cartesian(xlim=c(0,5))

#xlim()
diamonds %>% 
  ggplot() +
  geom_histogram( aes( x = carat ) ) +
  xlim( c(0,5) )

#coord_cartesian() with ylim()
diamonds %>% 
  ggplot() +
  geom_histogram( aes( x = carat ) ) +
  coord_cartesian(ylim=c(0,1000))

#ylim()
diamonds %>% 
  ggplot() +
  geom_histogram( aes( x = carat ) ) +
  ylim( c(0,1000) )


#7.4.1___________________________________________________________

#What happens to missing values in a histogram? What happens to missing values in a bar chart?
#Missing values are removed from histogram.and act like another category in bar chart

#What does na.rm = TRUE do in mean() and sum()?


mean(c(0, 1, 2, NA), na.rm = TRUE)
mean(c(0, 1, 2, NA), na.rm = FALSE)

sum(c(0, 1, 2, NA), na.rm = TRUE)
sum(c(0, 1, 2, NA), na.rm = FALSE)


#7.5.2.1______________________________________________________

#How could you rescale the count dataset above to more clearly..
#show the distribution of cut within colour, or colour within cut?
#calculate a new variable prop which is the proportion of each cut within a color
mutate(prop = n / sum(n)) %>%
  
  
  #Use geom_tile() together with dplyr to explore how average flight delays vary by destination and month of year. 
  #Previously, the ring was high, which made it difficult to read it 
  #I add limit = c(0, 1) to put the color scale between (0, 1). 
  geom_tile(mapping = aes(fill = prop))


#Why is it slightly better to use aes(x = color, y = cut) rather than aes(x = cut, y = color) in the example above?  
#makes it easier to compare within the dataset 

diamonds %>%
  count(color, cut) %>%
  group_by(cut) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = prop))

#OR

diamonds %>% 
  count(color, cut) %>%  
  treemap(diamonds, index=c("color","cut"),     vSize="n", type="index",
          fontcolor.labels=c("white","black"),
          align.labels=list(
            c("center", "top"), 
            c("right", "bottom")
          ),
          border.col=c("black","white"),
          border.lwds=c(1,0.70)
  )
#7.5.3.1______________________________________________________
#cut_width() vs cut_number()? How does that impact a visualisation of the 2d distribution of carat and price?
#When using cut_width(), we need to choose the width, and the number of bins will be calculated automatically.
#When using cut_number(), we need to specify the number of bins, and the widths will be calculated automatically.

#Visualise the distribution of carat, partitioned by price.

ggplot(
  data = diamonds,
  mapping = aes(color = cut_width(carat, 1, boundary = 0), x = price)
) +
  geom_freqpoly() +
  labs(x = "Price", y = "Count", color = "Carat")+
  stat_bin( bins = 40)


#Combine two of the techniques you've learned to visualise
ggplot(
  data = diamonds,
  mapping = aes(color = cut_number(carat, 5), x = price)
) +
  geom_freqpoly() +
  labs(x = "Price", y = "Count", color = "Carat")+
  stat_bin( bins = 40)

#Why is a scatterplot a better display than a binned plot for this case?
#because scatterplot reveal outliers that are not visible in  binned plot.










