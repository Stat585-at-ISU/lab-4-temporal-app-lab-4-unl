library(dplyr)
library(shiny)
library(plotly)

data <- AmesPD::presslog_isu %>%
  filter(!is.na(longitude) & !is.na(latitude))

ui <- fluidPage(
      sidebarLayout(
        sidebarPanel(
          shiny::dateRangeInput(
            'dateInput',
            'Please select a date range (default is full data range)',
            min = round(min(data$Date.Time.Reported), 'day'),
            max = round(max(data$Date.Time.Reported), 'day'),
            start = round(min(data$Date.Time.Reported), 'day'),
            end = round(max(data$Date.Time.Reported), 'day'))),
        mainPanel(
          h1('Map of Locations for ISU Police Department Press Log'),
          plotlyOutput('amesMap')
        )
      )
    )
