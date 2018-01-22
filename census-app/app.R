library("shiny")

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

ui <- fluidPage(
  titlePanel("censusVis"),
  sidebarPanel(
    # h6("Create demographic map with information from the 2010 US Census.", style = "color:gray"),
    helpText("Create demographic maps with 
             information from the 2010 US Census."),
    selectInput("var",
                # h5("Choose a variable to display: "),
                label = "Choose a variable to display",
                choices = list("Percent White",
                               "Percent Black",
                               "Percent Hispanic",
                               "Percent Asian"
                ),
                selected = "Percent White"
    ),
    sliderInput("range",
                label = "Range of interest",
                min = 0,
                max = 100,
                value = c(0,100)
    )
  ),
  mainPanel(
    textOutput("selected_var"),
    textOutput("min_max"),
    plotOutput("map")
  )
)

server <- function(input, output){
  output$selected_var <- renderText({
    paste("You have selected ", input$var)
  })
  
  output$min_max <- renderText({
    paste("You have chosen a range that goes from ", input$range[1], " to ", input$range[2])
  })
  
  output$map <- renderPlot({
    data <- switch(input$var,
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian
                   )
    plotColor <- switch(input$var,
                        "Percent White" = "blue",
                        "Percent Black" = "black",
                        "Percent Hispanic" = "green",
                        "Percent Asian" = "red"
                        )
    
    percent_map(var = data, color = plotColor, legend.title = input$var, max = input$range[2], min = input$range[1])
  })
}

## Concise version of server
# server <- function(input, output) {
#   output$map <- renderPlot({
#     args <- switch(input$var,
#                    "Percent White" = list(counties$white, "darkgreen", "% White"),
#                    "Percent Black" = list(counties$black, "black", "% Black"),
#                    "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
#                    "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))
#     
#     args$min <- input$range[1]
#     args$max <- input$range[2]
#     
#     do.call(percent_map, args)
#   })
# }

shinyApp(ui = ui, server = server)