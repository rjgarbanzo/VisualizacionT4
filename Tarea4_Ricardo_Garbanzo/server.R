#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(ggplot2)

function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  

  
  
  output$plot1 <- renderPlot({
  palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
  
  par(mar = c(5.1, 4.1, 0, 1))
  
  ggplot(data = selectedData(), mapping = aes_string(x = input$xcol, y = input$ycol, color = clusters()$cluster)) +
    geom_point()+
    labs(title = "Cantidad de clusters utilizados:",
         subtitle = input$clusters)+
    theme(
      plot.title = element_text(color = "Blue", size = 32, face = "bold"),
      plot.subtitle = element_text(color = "Red", size = 32)
    )
  
   })
}



# ggplot(data = selectedData(), mapping = aes_string(x = input$xcol, y = input$ycol, color = clusters()$cluster)) +
#   geom_point()

# ggtitle(input$clusters, "Clusters")

#############################
# output$plot1 <- renderPlot({
#   palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
#             "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
#   
#   par(mar = c(5.1, 4.1, 0, 1))
#      ggplot(data = selectedData(),

#mapping = aes_string (x = input$xcol, y = input$ycol, color = clusters()$cluster)) +
  
#  geom_point()
# })

##########################

# iris_clustered <- reactive({data.frame(selectedData, cluster=factor(clusters$cluster))
# })

# output$plot1 <- renderPlot({
#   ggplot(iris_clustered(), aes(x=names(iris_clustered[input$xcol]), 
#                                y=names(iris_clustered[input$ycol]), 
#                                color=iris_clustered()$cluster)) +
#     geom_point() 
# })