# =============================================================================
# title:    R Workshop Demo: Data Types in R 
# author:   Nura Kawa
# summary:  A quick demonstration of reading/writing csv, text files.
#           Loading data from web.
# data:     
# =============================================================================

# Vectors
# =============================================================================

instructors <- c("Adnan", "Vinitra", "Nura")
instructors
class(instructors) # character


vec <- 1:40 # numeric
sum(vec); mean(vec); mode(vec)


mixed <- c("cat", TRUE, "llama", NA, 11:15)
mixed
sum(mixed) # Error: invalid 'type' of argument


v <- rnorm(10000, 0, 1)
hist(v, col = "tomato")

# Lists
# =============================================================================

lst <- list(sin, 2:4, "sine", list(1, list(2)))
lst
lst[[1]](pi/2) # sin(pi/2)


# Matrices
# =============================================================================
mat <- matrix(c("apple", "orange", "banana"),
              nrow = 3,
              ncol = 3,
              byrow = FALSE) # I want to make column vectors
mat

A = matrix(1:25,
           nrow = 5,
           ncol = 5)

t(A) # transpose A

A %*% t(A) # A * (A transpose)

# Arrays
# =============================================================================
arr <- array(NA,dim = c(3, 3, 2))


# Factors
# =============================================================================
data(iris)

iris[sample(nrow(iris), 6),]

class(iris$Species)
levels(iris$Species)


# Data Frames
# =============================================================================

head(iris)
class(iris)
str(iris)

df <- data.frame("count" = 1:11,
                 "height" = seq(5.0, 6.0, by=0.1))


# Subsetting
# =============================================================================

# using the $

iris$Sepal.Width

# using a logical

logical_vector <- iris$Sepal.Width > 3.5

iris[logical_vector,]


# using []

iris[1:4, 1:2] # select rows 1 to 4, columns 1 to 2

# using [] and "name"

iris[1:10, "Sepal.Width"] # the first ten elements of the vector
# Sepal.Width
