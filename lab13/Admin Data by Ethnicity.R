if(!require("tidyverse")) install.packages('tidyverse')
if(!require("ggthemes")) install.packages('ggthemes')

library(tidyverse)
library(shiny)
library(shinydashboard)
library(ggthemes)

UC_admit <- readr::read_csv("data/UC_admit.csv")

ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions Stats by Ethnicity"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      selectInput("x", "Select Campus", choices = c("Berkeley", "Davis", "Irvine", "Los_Angeles", "Merced", "Riverside", "Santa_Barbara","San_Diego", "Santa_Cruz"), 
                  selected = "Davis"),
      selectInput("y", "Select Category", choices = c("Applicants", "Admits", "Enrollees"),
                  selected = "Applicants"),
      selectInput("z", "Select Ethnicity", choices = c("Asian", "African American", "American Indian", "Chicano/Latino", "White", "International", "Unknown"),
                  selected = "Asian"),
      plotOutput("plot", width = "1000px", height = "600px"))))

server <- function(input, output, session) { 
  output$plot <- renderPlot({
    UC_admit %>% 
      filter(Campus == input$x, Category == input$y, Ethnicity == input$z)%>%
      ggplot(aes(x = Academic_Yr, y = FilteredCountFR, fill=Ethnicity)) +
      geom_col()+
      theme_economist()+
      scale_x_continuous(breaks=seq(2010, 2019, by = 1))+
      labs(x ="Year",
           y = "Count")
  })
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)

























