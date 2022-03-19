setwd("C:/Users/Dell/Desktop")

  
library(rmarkdown)
library(shiny)
library(shinythemes)


#1st Task:


ui <- fluidPage(
  titlePanel("Sodaz Company "),
  theme = shinytheme("slate"),



  
  
  column(
    br(),
    p(strong("Available Quantites 150oz of Water,   420g  of CO2,    1190lb Flavoring, 800 hrs per month"),
      
      style = "text-align:center;
      font-family:Monospace;
      color:black;
      background-color:DarkOliveGreen;
      padding:15px;
      border:2px solid BlanchedAlmond;"),
    
    br(),
    p( strong("To maximize profit we must make 15 batches of grape soda. Which will make us", 
     "$450 a profit.")
      
      ,style = "text-align:center;
      font-family:Monospace;
      color:black;
      background-color:DarkOliveGreen;
      padding:15px;
      border:2px solid BlanchedAlmond;"),
    
    width=8),    
  
    
  selectInput("Soda", label = h3("Soda Teyps"),
                 choices = list("Strawberry Soda" = "5oz of Water, 4g of CO2, 35lb of Flavore, $12 pack",
                                "Orange Soda" = "15oz of Water, 4g of CO2, 20lb of Flavore, $24 pack",
                                "Grape Soda" = "10oz of Water, 4g of CO2, 15lb of Flavore, $30 pack"), 
                 selected = " "),
    
    hr(),
    fluidRow(column(3, verbatimTextOutput("value")))
    
    
  ) 
  #_____________________________________________________________________________

server <- function(input, output) {
  
  output$value <- renderPrint({ input$Soda })
  
  
}


shinyApp(ui = ui, server = server)




