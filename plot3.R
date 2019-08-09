## This is the Project Assignment for Month 4 Week 1
## Tim Margraf 8/9/2019
## plot3.R
library(stringr)
library(stats)
library(data.table)
 

## setwd("C:/Users/t15bxn8/Desktop/DataSciences/Projects/Month4Week1/Week1Project")


buildPlot3 <- function()
{
  dataForPlot <- read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
  dataForPlot$Date <- as.Date(dataForPlot$Date, format="%d/%m/%Y")
  dataForDatesInQuestion <- subset(dataForPlot, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
  dataForDatesInQuestion$Global_active_power <- as.numeric(dataForDatesInQuestion$Global_active_power)
  dataForDatesInQuestion$Sub_metering_1 <- as.numeric(dataForDatesInQuestion$Sub_metering_1)
  dataForDatesInQuestion$Sub_metering_2 <- as.numeric(dataForDatesInQuestion$Sub_metering_2)
  dataForDatesInQuestion$Sub_metering_3 <- as.numeric(dataForDatesInQuestion$Sub_metering_3)
  dataForDatesInQuestion$DateTime <- as.POSIXlt(paste(dataForDatesInQuestion$Date," ",dataForDatesInQuestion$Time," PDT"))
  par(mfrow = c(1,1))
  with(dataForDatesInQuestion, plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering"))
  with(dataForDatesInQuestion, points(DateTime, Sub_metering_2, type="l", col="red"))
  with(dataForDatesInQuestion, points(DateTime, Sub_metering_3, type="l", col="blue"))
  legend("topright", pch=45, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.copy(png,file="plot3.PNG")
  dev.off()
}  

