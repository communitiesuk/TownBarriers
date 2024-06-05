#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  map_outputs_main <- basemap_server(id = "map_main",
                                     data_objects = data_objects)
  data_layers <- data_layers_server(id = "inputs_1")
}
