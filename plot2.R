## This is the Project Assignment for Month 4 Week 1
## Tim Margraf 8/9/2019
## plot2.R
library(stringr)
library(stats)
library(data.table)
 

## setwd("C:/Users/t15bxn8/Desktop/DataSciences/Projects/Month4Week1/Week1Project")

buildPlot2 <- function()
{
  dataForPlot <- read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
  print(class(dataForPlot$Date))
  dataForPlot$Date <- as.Date(dataForPlot$Date, format="%d/%m/%Y")
  print(class(dataForPlot$Date))
  dataForDatesInQuestion <- subset(dataForPlot, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
  dataForDatesInQuestion$Global_active_power <- as.numeric(dataForDatesInQuestion$Global_active_power)
  ##  with(dataForDatesInQuestion, plot(Date, Global_active_power, type="l", col="red", ylab="Global Active Power (kilowatts)"))
  ##  with(dataForDatesInQuestion, plot(Global_active_power, type="l", col="red", ylab="Global Active Power (kilowatts)"))
  ##  with(dataForDatesInQuestion, plot(Global_active_power, type="l", col="red", ylab="Global Active Power (kilowatts)", ylim=c(0,12)))
  dataForDatesInQuestion$DateTime <- as.POSIXlt(paste(dataForDatesInQuestion$Date," ",dataForDatesInQuestion$Time," PDT"))
  with(dataForDatesInQuestion, plot(DateTime, Global_active_power, type="l", col="black", ylab="Global Active Power (kilowatts)"))
  dev.copy(png,file="plot2.PNG")
  dev.off()
}  
