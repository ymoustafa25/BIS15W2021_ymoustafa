

if(!require("tidyverse")) install.packages('tidyverse')
if(!require("ggthemes")) install.packages('ggthemes')

library(tidyverse)
library(shiny)
library(shinydashboard)
library(ggthemes)

UC_admit <- readr::read_csv("data/UC_admit.csv")

ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions Stats by Year"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      selectInput("x", "Select Campus", choices = c("Berkeley", "Davis", "Irvine", "Los_Angeles", "Merced", "Riverside", "Santa_Barbara","San_Diego", "Santa_Cruz"), 
                  selected = "Davis"),
      selectInput("y", "Select Category", choices = c("Applicants", "Admits", "Enrollees"),
                  selected = "Applicants"),
      selectInput("z", "Select Year", choices = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"),
                  selected = "2019"),
      plotOutput("plot", width = "1000px", height = "600px"))))

server <- function(input, output, session) { 
  output$plot <- renderPlot({
    UC_admit %>% 
      filter(Campus == input$x, Category == input$y, Academic_Yr == input$z)%>%
      ggplot(aes(x = Ethnicity, y = FilteredCountFR, fill=Ethnicity)) +
      geom_col()+
      theme_economist()+
      labs(x ="Ethnicity",
           y = "Count")
  })
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)

















































