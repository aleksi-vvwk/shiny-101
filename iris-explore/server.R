library(shiny)

shinyServer(
  
  function(input, output){
    
    output$summary <- renderPrint({
      summary(iris)
    })
    
    output$struct <- renderPrint({
      str(iris)
    })
    
    output$data <- renderTable({
      colm <- as.numeric(input$select)
      iris[colm]
      #head(iris)
    })
    
    output$myplot <- renderPlot({
      
      colm <- as.numeric(input$select)
      
      hist(iris[,colm],
           breaks = seq(0, max(iris[,colm]), l=input$slider+1),
           col = input$color,
           main = "Histogram Iris DataSet",
           xlab = names(iris[colm]),
           
        )
     })
  }
)