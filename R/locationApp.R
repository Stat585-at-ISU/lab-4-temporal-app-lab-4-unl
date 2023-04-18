# Get the presslog for Ames PD for an interval
#
# @importFrom dplyr filter `%>%`
# @import shiny
# @import plotly
# @return shiny app with location of calls
# @author Tyler Wiederich
# @examples
# \dontrun{
# locationApp()
# }
#

# # locationApp <- function(...){
#
#   data <- presslog_isu %>%
#     filter(!is.na(longitude) & !is.na(latitude))
#
#   ui <- fluidPage(
#     sidebarLayout(
#       sidebarPanel(
#         shiny::dateRangeInput(
#           'dateInput',
#           'Please select a date range (default is full data range)',
#           min = round(min(data$Date.Time.Reported), 'day'),
#           max = round(max(data$Date.Time.Reported), 'day'),
#           start = round(min(data$Date.Time.Reported), 'day'),
#           end = round(max(data$Date.Time.Reported), 'day'))),
#       mainPanel(
#         h1('Map of Locations for ISU Police Department Press Log'),
#         plotlyOutput('amesMap')
#       )
#     )
#   )
#
#   server <- function(input, output, session){
#
#     #Plotly map
#     output$amesMap <- renderPlotly({
#       fig <- presslog_isu %>%
#         filter(!is.na(longitude) & !is.na(latitude)) %>%
#         filter(Date.Time.Reported >= input$dateInput[1] & #greater than smallest date input
#                  Date.Time.Reported <= input$dateInput[2]) %>%  #smaller than larger date input
#         plot_ly(
#           type = 'densitymapbox',
#           lat = ~latitude,
#           lon = ~longitude,
#           coloraxis = 'coloraxis',
#           radius = 10)
#       fig <- fig %>%
#         layout(
#           mapbox = list(
#             style="stamen-terrain",
#             center= list(lon=mean(presslog_isu$longitude, na.rm = T),
#                          lat=mean(presslog_isu$latitude, na.rm = T)),
#             zoom = 11),
#           coloraxis = list(colorscale = "Viridis"),
#           geo = list(fitbounds = "locations"))
#
#       fig
#     }) #end amesMap
#   }
#
#   shinyApp(ui, server, ...)
#
# # }
#
#
#
#
#
