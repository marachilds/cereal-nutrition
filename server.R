# Require shiny, plotly
library(shiny)
library(plotly)

# Load source scripts
source('./scripts/setup.R')

# Define server
function(input, output) {

  output$mainPlot <- renderPlotly({
    
    # Build graph with plotly
    x <- list(
      title = "cereal rating"
    )
    y <- list(
      title = input$y
    )

    p <- plot_ly(cereal, 
                 x = ~rating,
                 y = ~get(input$y), 
                 color = ~get(input$color),
                 colors = "PuRd",
                 size = ~get(input$size),
                 type = 'scatter', 
                 mode = 'markers',
                 hoverinfo = 'text',
                 text = ~paste0('Cereal: ', cereal$cereal.name,
                               '</br>', "Manufacturer: ", cereal$mfr),
                 position = 'dodge',
                 marker = list(colorbar = list(title = input$color)))  %>%
                 layout(title = "Cereal Nutrition by Rating", 
                        xaxis = x, 
                        yaxis = y,
                        margin = list(b = 160), 
                        xaxis = list(tickangle = 45))

    plotly_build(p)
    
  })
  
}
