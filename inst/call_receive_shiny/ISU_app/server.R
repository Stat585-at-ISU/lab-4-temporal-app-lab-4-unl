library(dplyr)
library(shiny)
library(plotly)

server <- function(input, output, session){
  #Plotly map
  output$amesMap <- renderPlotly({
    fig <- presslog_isu %>%
      filter(!is.na(longitude) & !is.na(latitude)) %>%
      filter(Date.Time.Reported >= input$dateInput[1] & #greater than smallest date input
               Date.Time.Reported <= input$dateInput[2]) %>%  #smaller than larger date input
      plot_ly(
        type = 'densitymapbox',
        lat = ~latitude,
        lon = ~longitude,
        coloraxis = 'coloraxis',
        radius = 10)
    fig <- fig %>%
      layout(
        mapbox = list(
          style="stamen-terrain",
          center= list(lon=mean(presslog_isu$longitude, na.rm = T),
                       lat=mean(presslog_isu$latitude, na.rm = T)),
          zoom = 11),
        coloraxis = list(colorscale = "Viridis"),
        geo = list(fitbounds = "locations"))
    fig
  }) #end amesMap
}
