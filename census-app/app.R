library("shiny")

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
    textOutput("min_max")
  )
)

server <- function(input, output){
  output$selected_var <- renderText({
    paste("You have selected ", input$var)
  })
  
  output$min_max <- renderText({
    paste("You have chosen a range that goes from ", input$range[1], " to ", input$range[2])
  })
}

shinyApp(ui = ui, server = server)