#' app function
#'
#' @export
#'
#' @importFrom shiny runApp


app <- function(){
  appDir <- system.file("call_receive_shiny", "myapp", package = "AmesPD")
  if (appDir == ''){
    stop('Could not find this directory. Try reinstalling', call. = F)
  }

  shiny::runApp(appDir, display.mode = 'normal')
}
