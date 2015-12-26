

#lesson learned, must have libary loaded in local repository
#
#not sure what that means for packages when launched on shiny server
library(shiny)
library(UsingR)
library(wesanderson)
library(shinythemes)
data(galton)
##it seems like these values get read as text% where % repesents the row its on?
##also it would seem like there is capacity to set values ahead via putting them 
##directly into the console
x <<- x + 1
y <<- 0

diabetesRisk <- function(glucose) glucose/200

shinyServer(
     function(input, output) {
          output$contents <- renderTable({
          inFile <- input$file1
          
          if (is.null(inFile))
               return(NULL)
          
          read.csv(inFile$datapath, header=input$header, sep=input$sep, 
                   quote=input$quote)})
          output$text1 <-
               renderText({input$text1})
          output$text2 <-
               renderText({input$text2})
          output$text3 <-
               renderText({
                    input$goButton
                    isolate(paste(
                         input$text1,
                         input$text2
                    ))
               })
          y <<- y + 1
          output$newHist <- renderPlot({
               hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
               mu <- input$mu
               lines(c(mu, mu), c(0, 200),col="red",lwd=5)
               mse <- mean((galton$child - mu)^2)
               text(63, 150, paste("mu = ", mu))
               text(63, 140, paste("MSE = ", round(mse, 2)))
          })
          output$oid1 <- renderPrint({input$loc})
          output$oid2 <- renderPrint({input$yearSelect})
          output$oid3 <- renderPrint({input$date})
          output$inputValue <- renderPrint({input$glucose})
          output$prediction <- renderPrint({diabetesRisk(input$glucose)})
     }
)



