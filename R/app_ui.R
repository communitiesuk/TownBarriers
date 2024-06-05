#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny shinydashboard shinydashboardPlus leaflet dplyr leaflet.extras
#' @noRd
app_ui <- function(request) {
  header <- dashboardHeader(tags$li(class = "dropdown",
                                    tags$style(".main-header {max-height: 60px}"),
                                    tags$style(".main-header .logo {height: 60px}"),
                                    tags$style(".sidebar-toggle {height: 60px; padding-top: 1px !important;}"),
                                    tags$style(".navbar {min-height:60px !important}")
  ))
  sidebar <- dashboardSidebar(data_layers_ui("inputs_1"))
  body <- dashboardBody(basemap_ui("map_main"))

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    dashboardPage(header, sidebar, body, skin = "black")
    )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "TownBarriers"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
