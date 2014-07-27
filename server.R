library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$plot <- reactivePlot(function() {
    
    p <- qplot(mtcars[, input$x], mtcars$mpg, 
               color=factor(mtcars[, input$color]),
               xlab=input$x, ylab="mpg", geom=c("point", "smooth"))
    
    p <- p + labs(colour = input$color)
    
    print(p)
    
  }, height=400)
    
})