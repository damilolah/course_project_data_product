shinyUI(
  pageWithSidebar(
    
    headerPanel("Disease prediction"),
    
    sidebarPanel(
      numericInput('parasite', 'Malaria parasite in the blood  per microlitre', 100000, min = 50000, max= 200000, step = 10000 ),
      #  submitButton('submit'),
      
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("select...", "mtcars", "cars")),
      downloadButton('downloadData', 'Download')
      
      
    ),
    
    mainPanel(
      h3('Results of Prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction"),
      h4('Which is the probabilty of having Malaria'),
      tableOutput('table')
      
       )


)
)