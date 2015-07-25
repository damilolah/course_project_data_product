library(shiny)


malariaRisk <- function(parasite){
  parasite/200000
  
}


library(UsingR)
data(galton)

empty<- data.frame()

shinyServer(function(input, output) {
  
  output$inputValue <- renderPrint({input$parasite})
  output$prediction <- renderPrint({malariaRisk(input$parasite)})
  

  
  ## returns the meaning of the selection
  datasetInput <- reactive({
    
    switch(input$dataset,
           "select..." = empty,
           "mtcars" = mtcars,
           "cars" = cars)
  })
  
  
  
  
  output$table <- renderTable({
    datasetInput()
    
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste(input$dataset, '.csv', sep='') 
    },
    content = function(file) {
      write.csv(datasetInput(), file)
    }
  )
})