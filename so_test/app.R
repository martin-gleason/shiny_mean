ui <- fluidPage(
  
  actionButton("buttonNext", "Next"),
  
  radioButtons("radio", "Your Decision:",
               choices = c("No Decision" = 'NoDec', "Yes" = 'yes', "No" = 'no'),
               selected = 'NoDec'),
  
  plotOutput("TimeSeriesPlot")
)


server <- function(input,output,session) {
  
  clickNext <- reactive({
    isolate(input_radio <- input$radio)
    randomNumber <- input$buttonNext
    print(c(input$buttonNext,randomNumber,input_radio))
    return(randomNumber)
  })
  
  observeEvent(input$buttonNext,
               {
                 updateRadioButtons(session,'radio',selected = -1)
               })
  
  output$TimeSeriesPlot <- renderPlot({ 
    i <- clickNext()
    plot(i)
  })
  
}
shinyApp(server = server, ui = ui)