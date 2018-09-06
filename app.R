#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("shiny_mean_vector.R")
source("Mode.R")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Heights in Inches Excercise"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput(inputId = "height", label = "Enter Heights in Inches (seperate with space):", 
                    value = "", width = "100%"),
        actionButton("addButton", "Calculate Mean")
        
        
        
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("histPlot"),
         h3(textOutput("mean")),
         h3(textOutput("median")),
         h3(textOutput("range")),
         h3(textOutput("mode"))
         
      )
   )
)

# Define server logic required to draw a histogram with a button push
server <- function(input, output) {
  
  observeEvent(input$addButton, {
    x <- str_split(input$height, " ")
    x <- unlist(x)
    x <- as.numeric(x)
    
    output$histPlot <- renderPlot({
     hist(x, breaks = 10,
          col = 'blue', border = 'white',
          main = "Distribution of Heights in Inches")
    
      minIn <- min(x)
      maxIn <- max(x)
      modeIn <- Mode(x)
      
    output$mean <- renderText(paste("The mean is: ", mean(x, na.rm =TRUE), " inches."))
    output$median <- renderText(paste("The median is: ", median(x, na.rm = TRUE), "."))
    output$range <- renderText(paste("The range is from ", minIn, " to ", maxIn, "."))
    output$mode <- renderText(paste("The mode is ", modeIn, "."))

   })
  })
  
  
  
  

}

# Run the application 
shinyApp(ui = ui, server = server)

