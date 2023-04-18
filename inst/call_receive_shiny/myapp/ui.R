library(dplyr)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(shiny)

ames <- AmesPD::presslog_ames
time <- ames %>%
  mutate(date = as_date(`Call Received Date/Time`)) %>%
  mutate(hour = hour(ames$`Call Received Date/Time`))

ui <- fluidPage(

  titlePanel('Ames presslog'),

  sidebarPanel(
    selectInput('rec', 'How Call Received', choices = unique(time$`How Call was Rec'd`))
  ),

  mainPanel(
    tabsetPanel(
      tabPanel('How Case Received', plotOutput('case'))
    )
  )
)
