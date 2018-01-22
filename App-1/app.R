library("shiny")

ui <- fluidPage(
  titlePanel("Hello world"),

  sidebarLayout(
    # position = "right",
    sidebarPanel(
      h2("Installation"),
      p("Shiny is available is CRAN, so you can install it the usual way from R console: "),
      code("install.packages(\"shiny\")"),
      br(),
      br(),
      br(),
      br(),
      img(src = "rstudio.png", height = 70, width = 200),
      p("Shiny is a product of ", 
        span("RStudio", style = "color:blue")
        )
    ),
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a new package from RStudio that makes it ", em("incredibly"),"easy to build interactive web applications with R"),
      br(),
      p("For an introduction and live examples, visit the ", a(href = "https://shiny.rstudio.com", "Shiny homepage.")),
      br(),br(),
      h2("Features"),
      p("- Build useful web applications with only a few lines of code—no JavaScript required."),
      p("- Shiny applications are automatically 'live' in the same way that ", 
        strong("spreadsheets"),
        " are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.")
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui = ui, server = server)