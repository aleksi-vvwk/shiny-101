library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = h4('Iris Dataset', align = 'center')),
  
  sidebarLayout(
    
    sidebarPanel(
      selectInput('select',
                  'Select Variable your DataSet:', 
                  choices = c('Sepal.Length' = 1, 'Sepal.width' = 2, 'Petal.Length' = 3, 'Petal.Width' = 4),
                  selected = 'Sepal.Length'),
      
      sliderInput('slider',
                  "Select the number BIN's for Histogram:",
                  min = 5,
                  max = 25,
                  value = 15),
      
      radioButtons('color',
                   'Select Color:', 
                   choices = c('Red', 'Green', 'Blue'),
                   selected = 'Blue')
      
    ),
    
    mainPanel(
      tabsetPanel(type = 'tab',
                  tabPanel('Summary', verbatimTextOutput('summary')),
                  tabPanel('Structure', verbatimTextOutput('struct')),
                  tabPanel('Data', tableOutput('data')),
                  tabPanel('Plot', plotOutput('myplot'))
                  )
    )
  )
))