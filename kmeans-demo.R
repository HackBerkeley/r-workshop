# =============================================================================
# title:    R Workshop Demo: Kmeans Clustering 
# author:   Nura Kawa
# summary:  A quick demonstration of how to download data,
#           visualize high-dimensional data with PCA,
#           and cluster both large and small datasets with kmeans
# data:     mnist dataset (subset)
#           iris dataset
# =============================================================================


# load libraries
# =============================================================================
library(ggplot2)
library(ggfortify)
library(cluster)

# if you do not have these packages installed, 
# simply run install.packages. For example:
# install.packages("ggplot2")
# library(ggplot2)

# import data files
# =============================================================================

# make sure that your data files are in your current working directory.
# use getwd() to see your current working directory and setwd() to change it.

# mnist_training <- read.csv("mnist_train.csv") #mnist training data
# mnist_testing <- read.csv("mnist_test.csv") #mnist testing data
data(iris) # iris dataset comes built-in with RStudio

# mnist data set
# =============================================================================

# set label column as factor for both training and testing
colnames(mnist_testing)[1] <- "label"
mnist_testing$label <- factor(as.character(mnist_testing$label))

colnames(mnist_training)[1] <- "label"
mnist_training$label <- factor(as.character(mnist_training$label))

# visualize mnist training data with PCA (principal component analysis)
# =============================================================================

pr <- prcomp(mnist_training[,-1]) # performs PCA
screeplot(pr, type = "l", main = "mnist training pca screeplot") # screeplot - shows how well
# the principal components describe the data.

# plot the PCA view of our data (plots two components)
pca <- autoplot(pr, 
                data = mnist_training,
                colour = 'label')
pca


# cluster the mnist data with kmeans
# =============================================================================

t <- Sys.time() # saves current time for timer

set.seed(1)
km <- kmeans(mnist_testing[,-1], # do not do kmeans on the labels!
             centers = 10) # we have digits 0 through 9, so 10 clusters

difftime(Sys.time(), t) # calculates the time it took to run this

# confusion matrix: how clean are the clusters?
table(km$cluster,
      as.numeric(mnist_testing$label))

accuracy <- sum(km$cluster == as.numeric(mnist_testing$label))/nrow(mnist_testing)

# kmeans is not quite the best...why?

# visualization and kmeans with iris dataset
# =============================================================================

data(iris)

ap_iris <- autoplot(princomp(iris[,-5]),
                    data = iris,
                    colour = "Species")

ap_iris

km_iris <- kmeans(iris[,-5], centers = 3)
table(km_iris$cluster, as.numeric(iris$Species))

clustered_iris <- cbind(iris, "cluster" = km_iris$cluster)
clustered_iris$cluster = factor(clustered_iris$cluster)

autoplot(fanny(iris[-5], 3), frame = TRUE)

# accuracy - not too bad!
#sum(km_iris$cluster == as.numeric(iris$Species))/nrow(iris)

