#group project 1
install.packages("shiny")
install.packages("fpp3")
library(shiny)
library(fpp3)
data("tourism")
ui <- fluidPage(
                  plotOutput("plot"),
                  
                  checkboxGroupInput("checkGroup", label = h3("Travel Reason"), 
                                     choices = list("Business" = "Business", "Holiday" = "Holiday", 
                                                    "Visiting" = "Visiting", "Other" = "Other"),
                                     selected = c("Business","Holiday", "Visiting", "Other"))
                  
  )
  
server <- function(input, output){
  output$plot <- renderPlot({
    new<-filter(tourism, Region=="Adelaide",Purpose %in% input$checkGroup)
    autoplot(new)
  })
    output$value <- renderPrint({ input$checkGroup})

                               }

shinyApp(ui = ui, server=server)

