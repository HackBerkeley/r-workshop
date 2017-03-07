 # =============================================================================
# title:    R Workshop Demo: Reading and Writing Data 
# author:   Nura Kawa
# summary:  A quick demonstration of reading/writing csv, text files.
#           Loading data from web.
# data:     
# =============================================================================

setwd("data") # change to your data directory

# reading web data
# =============================================================================
setwd("web")

library(RCurl)
library(XML)
library(stringr)
library(plyr)

# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)

# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]

filenames <- filenames[1:5] # for the purpose of saving time with this demo

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")


# reading CSV files
# =============================================================================

setwd("..")
aug <- read.csv("web/JCMB_2015_Aug.csv",
                header = TRUE)
View(aug)

# now, let us create a new .csv and write it. we only want to keep the date,
# time, and rainfall

humidity <- data.frame("date-time" = aug$date.time,
           "humidity" = aug$relative.humidity....)

# writing CSV files
# =============================================================================
write.csv(humidity, file="humidity-august.csv")

# reading text files
# =============================================================================
ast <- readLines("ast.txt")
ast

# reading web data
# =============================================================================
setwd("web")

library(RCurl)
library(XML)
library(stringr)
library(plyr)

# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)

# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]

filenames <- filenames[1:5] # for the purpose of saving time with this demo

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")
