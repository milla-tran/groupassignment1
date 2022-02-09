#group project 1
install.packages("shiny")
install.packages("fpp3")
library(shiny)
library(fpp3)
data("tourism")
ui <- fluidPage("Hello world!",
       plotOutput("plot")         
               )

server <- function(input, output){
   new<-filter(tourism, tourism$Region=="Adelaide")
  output$plot<-renderPlot((autoplot(new)))
}
  
shinyApp(ui = ui, server=server) 
