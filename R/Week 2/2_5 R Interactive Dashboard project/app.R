#upload library
library(shinydashboard)
library(shiny)
library(shinythemes)
library(graphics)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(DT)
library(fmsb)
library(tidyverse)
library(viridis)
library(plotly)
library(rsconnect)

#upload data file...
data <- read.csv("consumer.csv")

#changed the data type of "Year" column..
data$year <- as.character(data$year)
typeof(data$year)

#start...

ui <- dashboardPage( skin = "purple",
  dashboardHeader(title = "CONSUMER GOODS"), 
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Main", tabName = "Main", icon = icon("star")),
      menuItem("Dataset", tabName = "datasetoverview", icon = icon("file")),
      menuItem("Histogram Plot", tabName = "Visualization1", icon = icon("thumbtack")),
      menuItem("Scatter Plot", tabName = "Visualization2", icon = icon("thumbtack")),
      menuItem("Line Plot", tabName = "Visualization3", icon = icon("thumbtack"))
    )
  ),
#----------------------------------------------------------------------------
  dashboardBody( 
    tabItems(
      #main page...
      tabItem("Main", h3(strong("Dashboard of Consumer Goods"),
      style ="font-family:Monospace;"),
      
              img(src ="logo.jpg",height=200,width=500),
              
               br(),
               br(),
               br(),
               br(),
      #intro.... 
            h3( strong("Astrophiles Members: "),
                style ="font-family:Monospace;"),
       
                   h4("Ghadeer Amer", style ="font-family:Monospace;"),
                   h4("Fatimah Asiri", style ="font-family:Monospace;"),
                   h4("Rawan Almutiri", style ="font-family:Monospace;"),
                   h4("Rawan Feaz", style ="font-family:Monospace;"),
                   h4("Ola Ahmed", style ="font-family:Monospace;"),
                  
            align="center",
          ), #main page...
      
      # Data set Overview page...
     tabItem("datasetoverview",
            h3(strong("Dataset Overview "), style ="font-family:Monospace;"),   # summary of data...
            verbatimTextOutput("summary"),
            dataTableOutput('table'),
            selectInput("select", "Select columns to display", names(data), multiple = TRUE),
            dataTableOutput("mytable")
     ), #end Data set Overview page...
    
     
     #Visualization 1 page...
    tabItem("Visualization1",
            h3(strong("Histogram plot by Columns"), style ="font-family:Monospace;"),
            #  3 different inputs to customize your plots.
            box(selectInput("type", "choice Column", 
                            c("volume", "CostPerUnit", "PricePerUnit","ProfitPercent")),
                width = 3), #select "Type"
            
            box(selectInput("col", "Bins Color", 
                            c("YellowGreen", "MidnightBlue", "Chocolate","DarkSlateBlue")),
                width = 3), #select "colors"
            
            box(sliderInput("bins",
                        "Number of bins:",
                        min = 1,                          
                        max = 80,
                        value = 30)),  #slider bar
            
            box(plotOutput(outputId = "linear"), width = 12)), #the plot
    #End Visualization 1 page...
    
    
    # Visualization 2 page...
    tabItem("Visualization2",
            h3(strong("Costs-Revenues relationship by products group"), style ="font-family:Monospace;"),
            br(),
            br(),
            
            box(selectInput("select1" , label = "Prodect Group", choices = unique(data$ProdectGroup),selected = "Meat"), width = 3),
            box(plotOutput(outputId = "c"),width = 9)
          
           ), #End Visualization 2
    
    
    #Visualization 3 page...
    tabItem("Visualization3",
            h3(strong("Costs-Revenues relationship by products group"), style ="font-family:Monospace;"),
            selectizeInput(
              inputId = "typee", 
              label = "Select a ProdectGroup", 
              choices = unique(data$ProdectGroup), 
              selected = "coffee",
              multiple = FALSE
            ),
            plotlyOutput(outputId = "p")
           )# End Visualization 3...
    )                                                   
  )
)

#-------------------------------------------------------------------------------

server <- function (input, output) {

#summary about data
  output$summary <- renderPrint({
    summary(data)
  })
  
#output of page dataset overview
  output$mytable = renderDataTable({
    columns = names(data)
    if (!is.null(input$select)) {
      columns = input$select
    }
    data[,columns,drop=FALSE]
  })
  
#output page Visualization 1
  output$linear <- renderPlot({
    Values   <- data[, input$type] 
    bins <- seq(min(Values), max(Values), length.out = input$bins + 1)
    
        hist(Values, breaks = bins, col = input$col, border = 'white')
  })
  
#output of Visualization 2  
  output$c = renderPlot({
    data %>%
      filter(ProdectGroup == input$select1) %>%
      ggplot(aes(x = TotalCost , y=Revenues , color= ProdectGroup )) +
      geom_point()  })
  
#output of Visualization 3 
  output$p <- renderPlotly({
    plot_ly(data, x = ~Revenues, y = ~TotalCost) %>%
      filter(ProdectGroup %in% input$typee) %>%
      group_by(ProdectGroup) %>%
      add_lines()
  })

  }
# Run the application 
shinyApp(ui = ui, server = server)


