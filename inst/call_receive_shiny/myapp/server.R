library(dplyr)
library(tidyverse)
library(lubridate)
library(shiny)


server <- function(input, output){
  ames <- AmesPD::presslog_ames
  time <- presslog_ames %>%
    mutate(date = as_date(`Call Received Date/Time`)) %>%
    mutate(hour = hour(ames$`Call Received Date/Time`))

  ames_subset <- reactive({time %>% filter(`How Call was Rec'd` == input$rec)})

  output$case <- renderPlot({
    ggplot(data = ames_subset(), aes(x = hour, fill = hour)) +
      geom_bar(stat = 'count') +
      theme_bw() +
      ggtitle('Time')
  })
}
