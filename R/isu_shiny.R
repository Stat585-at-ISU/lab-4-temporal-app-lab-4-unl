#' app function
#'
#' @export
#' @author Tyler Wiederich
#' @importFrom shiny runApp


isu_app <- function(){
  appDir <- system.file("call_receive_shiny", "isu_app", package = "AmesPD")
  if (appDir == ''){
    stop('Could not find this directory. Try reinstalling', call. = F)
  }

  shiny::runApp(appDir, display.mode = 'normal')
}
