library(shiny)
library(plotly)

# Load source scripts
source('./scripts/setup.R')

# Create Shiny UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cereals by Manufacturer"),
  
  # Sidebar with select inputs for y, color, and size
  sidebarLayout(
    
    sidebarPanel(
            
      selectInput("y", "By:", choices = opt, selected = "calories"),
      selectInput("color", "Color:", choices = opt, selected = "sugars"),
      selectInput("size", "Size:", choices = opt, selected = "protein"),

      "Key:", br(),
      "A = American Home Food Products", br(),
      "G = General Mills", br(),
      "K = Kelloggs", br(),
      "N = Nabisco", br(),
      "P = Post", br(),
      "Q = Quaker Oats", br(),
      "R = Ralston Purina"
      
      ),
    
    # Plot it!
    mainPanel(
      plotlyOutput('mainPlot', height = "600px", width = "800px")
    )
    )
  )
)
