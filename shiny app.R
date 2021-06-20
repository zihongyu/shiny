library(shiny)


data <- read.csv("national-history.csv")


ui <- fluidPage(
  
  # App title ----
  titlePanel("COVID-19 new deaths/case vs. time "),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      plotOutput("distplot")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    x    <- data$time
    x    <- na.omit(x)
    hist(x, breaks = time, col = "#75AADB", border = "black",
         xlab = "time",
         main = "Histogram of COVID-19 new deaths/case")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
