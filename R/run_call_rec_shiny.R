#' app function
#'
#' @export
#' @author Hiiiua
#' @importFrom shiny runApp


ames_app <- function(){
  appDir <- system.file("call_receive_shiny", "ames_app", package = "AmesPD")
  if (appDir == ''){
    stop('Could not find this directory. Try reinstalling', call. = F)
  }

  shiny::runApp(appDir, display.mode = 'normal')
}
