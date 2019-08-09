## This is the Project Assignment for Month 4 Week 1
## Tim Margraf 6/18/2019
## plot1.R
library(stringr)
library(stats)
library(data.table)
 

## setwd("C:/Users/t15bxn8/Desktop/DataSciences/Projects/Month4Week1/Week1Project")

buildPlot1 <- function()
{
  dataForPlot <- read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
  print(class(dataForPlot$Date))
  dataForPlot$Date <- as.Date(dataForPlot$Date, format="%d/%m/%Y")
  print(class(dataForPlot$Date))
  dataForDatesInQuestion <- subset(dataForPlot, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
  dataForDatesInQuestion$Global_active_power <- as.numeric(dataForDatesInQuestion$Global_active_power)
  hist(dataForDatesInQuestion$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.copy(png,file="plot1.PNG")
  dev.off()
}  
