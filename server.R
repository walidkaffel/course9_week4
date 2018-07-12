#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
        model <- reactive({
                var_selection <- c(TRUE, input$scyl, input$sdisp, input$shp, input$sdrat,
                                   input$swt, input$sqsec, input$svs, input$sam,
                                   input$sgear, input$scarb)
                my_df <- mtcars[, var_selection]
                lm(mpg ~ ., data = my_df)
        })
        
        output$slopeOut <- renderText({
                paste(as.character(input$variable), 
                        as.character(model()$coefficients[as.character(input$variable)]),
                        sep=":")
                        
        })
        
        output$intOut <- renderText({
                model()$coefficients[1]
                })
        
        output$plot1 <- renderPlot({
                plot(mpg ~ mtcars[, input$variable], xlab = as.character(input$variable),
                     ylab = "MPG", 
                     cex = 1.5, pch = 16, bty = "n", data=mtcars)
                abline(a=model()$coefficients[1], b=model()$coefficients[as.character(input$variable)], col = "blue", lwd = 2)
                })
        
        
})
