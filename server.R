library(shiny)
data <- read.csv("Headcount.csv")

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({

    plotdata <- aggregate(data = data, Headcount ~ Worker_Type + Report_Period, FUN = sum, 
                      subset = (Country == input$Country & (Worker_Type %in% input$Worker_Type)))
    
    barplot(plotdata$Headcount, names.arg = plotdata$Report_Period)

  })
  
})
