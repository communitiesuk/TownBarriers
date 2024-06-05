#' @noRd
data_layers_ui <- function(id) {
  ns <- shiny::NS(id)

  checkboxGroupInput( "layer", "Select Layer to Display:",
                      choices = c("Topography" = "layer1", "Built-up areas" = "layer2"),
                      selected = "layer1")
}

#' @noRd
data_layers_server <- function(id){
    moduleServer(
      id,
      function(
    input,
    output,
    session) {
        data_objects <- reactiveValues()
      }
    )
  }

