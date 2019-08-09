## This is the Project Assignment for Month 4 Week 1
## Tim Margraf 8/9/2019
## plot4.R
library(stringr)
library(stats)
library(data.table)

##COMMENT - PLEASE READ: Instructions asked for 480x480, but only for plot 4, I made it bigger, because the resolution was too low to show 4 plots at once

## setwd("C:/Users/t15bxn8/Desktop/DataSciences/Projects/Month4Week1/Week1Project")

buildPlot4 <- function()
{
  dataForPlot <- read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
  dataForPlot$Date <- as.Date(dataForPlot$Date, format="%d/%m/%Y")
  dataForDatesInQuestion <- subset(dataForPlot, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
  dataForDatesInQuestion$Global_active_power <- as.numeric(dataForDatesInQuestion$Global_active_power)
  dataForDatesInQuestion$Global_reactive_power <- as.numeric(dataForDatesInQuestion$Global_reactive_power)
  dataForDatesInQuestion$Voltage <- as.numeric(dataForDatesInQuestion$Voltage)
  dataForDatesInQuestion$Sub_metering_1 <- as.numeric(dataForDatesInQuestion$Sub_metering_1)
  dataForDatesInQuestion$Sub_metering_2 <- as.numeric(dataForDatesInQuestion$Sub_metering_2)
  dataForDatesInQuestion$Sub_metering_3 <- as.numeric(dataForDatesInQuestion$Sub_metering_3)
  dataForDatesInQuestion$DateTime <- as.POSIXlt(paste(dataForDatesInQuestion$Date," ",dataForDatesInQuestion$Time," PDT"))
##  png(file="plot5.PNG", width=1000, height=1000, res=300)
  par(mfrow = c(2,2))
  par(cex = 0.5) ## Make text bigger so we can read the legend later, ugh what a bad way to do it!!!  Crappy R
##  par(strheight = 2) #didn't work to make text bigger
##  par(lheight = 2) #didn't work to make text bigger
  par(ps = 16) # cex value above made x and y axis labels too small, this made them bigger again
  with(dataForDatesInQuestion, 
       {
          plot(DateTime, Global_active_power, type="l", col="black", ylab="Global Active Power")
          plot(DateTime, Voltage, type="l", col="black", ylab="Voltage")
          plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering")
          points(DateTime, Sub_metering_2, type="l", col="red")
          points(DateTime, Sub_metering_3, type="l", col="blue")
##          legend("topright", pch=45, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="o", cex=0.25, text.font=38)
          legend("topright", pch=45, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="o", cex=1.25, pt.cex=2, y.intersp = 0.3)
          plot(DateTime, Global_reactive_power, type="l", col="black", ylab="Global Reactive Power")
       })
  dev.copy(png,file="plot4.PNG",width=12, height=10, units="in",res=200)  ## make resolution bigger, can't see it well
##  dev.copy(png,file="plot4.PNG")
  dev.off()
  
  ##  close(dataForPlot) #doesn't work, but still eats memory, and holds file open
}  


