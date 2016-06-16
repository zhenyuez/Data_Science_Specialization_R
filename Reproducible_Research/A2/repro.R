library(ggplot2)
url="http://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url, destfile = "~/data/R/stormData.csv.bz2")
data<-read.csv("~/data/R/stormData.csv.bz2")
dim(data)
head(data,n=10)
str(data)
         