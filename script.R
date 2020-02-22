
  
  # Combine the selected variables into a new data frame
  selectedData <- iris[, c(1, 2)]
library(ggplot2)
  
  clusters <- kmeans(selectedData, 3)
clusters$centers
  
  
  iris_clustered <- data.frame(selectedData, cluster=factor(clusters$cluster))
 ggplot(iris_clustered, aes(x=Sepal.Length, y=Sepal.Width, color=cluster)) + 
   geom_point() 
  
         
 names(iris_clustered[1])
 