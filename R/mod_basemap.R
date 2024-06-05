' map UI module
#'
#' @noRd
basemap_ui <- function(id, tab) {
  ns <- NS(id)
  # outputID <- ifelse(tab == "map", "renderedMap", "summaryMap")
  # height <- ifelse(tab == "map", "91vh", "59vh")
  #
  leafletOutput(ns("summaryMap")
                , height = "91vh"
                )
  # %>% withSpinner(color="#012169", hide.ui = FALSE)
}

#' map server module
#'
#' @noRd
basemap_server <- function(id, data_objects) {
  moduleServer(id,
               function(input, output, session) {
#
#                  map <- reactive({
#
#                    if(is.null(data_objects$findOrSearch))
#                      return(placeholdermap(6))
#
#                    basemap(
#                      places = data_objects$places,
#                      medical_places = data_objects$medical_places,
#                      care_places = data_objects$care_places,
#                      education_places = data_objects$education_places,
#                      area = data_objects$area,
#                      postcode = data_objects$sel_pc
#                    ) %>%
#                      scalezoom(
#                        radius = data_objects$radius_raw,
#                        unit = data_objects$radius_unit_raw,
#                        lng = data_objects$sel_pc$longitude,
#                        lat = data_objects$sel_pc$latitude
#                      )
#                  })
#                  output$renderedMap <- renderLeaflet({ map()})
#
#
                 user_map <- reactive({

                   # if(is.null(data_objects$findOrSearch))
                     return(leaflet(
                       # options = leafletOptions(zoomSnap = 0.01,
                                                             # zoomDelta = 0.1)
                       ) %>%
                              addTiles() %>%

                         # setView(lat = 54.85287395496313,
                         #         lng = -4.462048699460834,
                         #         zoom = zoom)

                         setView(lng = -1.5, lat = 53.0, zoom = 6) %>%  # Center map on England
                         setMaxBounds(lng1 = -6, lat1 = 49, lng2 = 2, lat2 = 56))

                   # map() %>%
                   #   makeusermap(
                   #     postcode = data_objects$sel_pc,
                   #     radius = data_objects$radius_raw,
                   #     unit = data_objects$radius_unit_raw,
                   #     groups = input$renderedMap_groups
                   #   )
                 })
                 output$summaryMap <- renderLeaflet({ user_map()})
                 return(
                   # list(
                   # map = map,
                   user_map = user_map
                 # )
                 )
               })
}

