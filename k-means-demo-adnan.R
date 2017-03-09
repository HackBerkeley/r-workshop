data(iris)

library(plotly)

p1 <- plot_ly(iris, x=~Sepal.Length, y=~Sepal.Width, z=~Petal.Length, color=~Species) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Sepal Length'),
                      yaxis = list(title = 'Sepal Width'),
                      zaxis = list(title = 'Petal Length')))
p1

p2 <- plot_ly(iris, x=~Sepal.Width, y=~Petal.Width, z=~Petal.Length, color=~Species) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Sepal Length'),
                      yaxis = list(title = 'Sepal Width'),
                      zaxis = list(title = 'Petal Length')))
p2

km_iris <- kmeans(iris[,-5], centers = 3)
km_iris$cluster


clustered_iris <- cbind(iris, "cluster" = km_iris$cluster)
clustered_iris$cluster = factor(clustered_iris$cluster, labels=c("virginica", "setosa", "versicolor"))

sum(clustered_iris$Species == clustered_iris$cluster) / nrow(clustered_iris)
