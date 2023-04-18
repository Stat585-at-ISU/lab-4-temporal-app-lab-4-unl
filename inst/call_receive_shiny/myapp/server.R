library(dplyr)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(shiny)

ames <- AmesPD::presslog_ames
time <- ames %>%
  mutate(date = as_date(`Call Received Date/Time`)) %>%
  mutate(hour = hour(ames$`Call Received Date/Time`))

server <- function(input, output){

  # time$hour <- as.factor(time$hour)

  ames_subset <- reactive({time %>% filter(`How Call was Rec'd` == input$rec)})

  output$case <- renderPlot({
    ggplot(data = ames_subset(), aes(x = hour, fill = hour)) +
      geom_bar(stat = 'count') +
      theme_bw() +
      ggtitle('Time')
  })
}
