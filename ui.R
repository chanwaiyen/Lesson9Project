library(shiny)
data <- read.csv("Headcount.csv")
country_list <- levels(data$Country)
worker_type_list <-levels(data$Worker_Type)[c(3,2,1)]

shinyUI(fluidPage(
  
  titlePanel("Headcount Trends"),  # End of titlePanel
  
  sidebarPanel(
    
    h4("This application shows you Company Headcount Trend from Jan 2014"),
    p("Select your country from the drop down list. The plot will show your country headcount over time"),
    p("Check at least one worker type. Check more to add addition information to the plot")
    
  ), # End of sidebarPanel
  
  mainPanel(
  
    # Dropdown List with Country
    selectInput(inputId = "Country",  
              label = "Select Country:",  
              choices = country_list,  
              selected = country_list[1]),
  
  
    # Multi-Select Group Checkbox
    checkboxGroupInput(inputId = "Worker_Type", label = "Select Worker Type (Multi-select)",
                     worker_type_list, selected = worker_type_list[1]),
  
  
    # Plot Headcount trend
  
    plotOutput(outputId = "plot", height = "300px")
  
  ) # End of mainPanel
  
))
