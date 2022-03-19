
setwd("C:/Users/Dell/Desktop")
library(shiny)
library(shinythemes)
library(tidyverse)
library(datasets) 
library(dplyr, warn.conflicts = FALSE)
library(ggplot2)
#UCBAdmissions # the dataset
num_vars <- c("carat ", "clarity", "depth ", "table", "price", "x", "y",  "z")

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("UCBAdmissions"),
  theme = shinytheme("slate"),
  
  selectInput("var", "filter", choices = num_vars),
  numericInput("min", "Minimum", value = 1),
  
  verbatimTextOutput("summary"),
  tableOutput("output")
)

#===============================================================================


server <- function(input, output, session) {
  
  output$summary <- renderPrint({
    summary(diamonds)
  })
  
  data <- reactive(diamonds %>% filter(input$var > input$min))
  output$output <- renderTable(head(data()))
  
}

# Run the application 
shinyApp(ui = ui, server = server)




