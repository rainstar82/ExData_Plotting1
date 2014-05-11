## Household Power Consumption Peer Assignment, Plot 4
## ./electric/household_power_consumption.txt
## Anahita Saghafi 11/05/2014
##--------------------------------------------------------------------        


##Set the working directory
setwd("C:\\Users\\anahitas\\Documents\\coursera\\Exploratory Data Analysis\\peer")

##--------------------------------------------------------------------------
## Create Directory and download the zip file

If(!file.exists("electric"){
        dir.create("electric")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./electric/electric.zip")
datedownloaded <- date()
datedownloaded

## If zip file manually unzipped, the following will read the file.

powerData <- read.table("./electric/household_power_consumption.txt", sep=";", header=TRUE, colClasses = "character")

## Subsetting the data frame with the selected dates: "01/02/2007", "02/02/2007"   

DF1 <- powerData[c(powerData$Date =="1/2/2007"),]
DF2 <- powerData[c(powerData$Date=="2/2/2007"),]

## Binding  the data for two selected dates.

DF <- rbind(DF1,DF2)


##Creating DateTime   
## General Syntax is
##df$dateTime <- as.POSIXct(strptime(paste(part1,part2), "format1 format2"))

DF$DateTime <- as.POSIXct(strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S"))

## Plotting ...

library(datasets)

x <- DF$DateTime
a<- as.numeric(as.character(DF$Global_active_power))
b<- as.numeric(as.character(DF$Voltage))
c<- as.numeric(as.character(DF$Global_reactive_power))
y1<- DF$Sub_metering_1
y2<- DF$Sub_metering_2
y3<- DF$Sub_metering_3


png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(DF,{
        plot(x,a, type="l", xlab="", ylab="Global Active Power(Kilowatts)" )
        plot(x,b, type="l", xlab="datetime", ylab="Voltage)" )
        
        with(DF, plot(x,y1, type="l",ylab = "Energy sub metering", xlab=""))
        with(subset(DF, colname = "Sub_metering_2"), lines(x,y2, type="l", col="red"))
        with(subset(DF, colname = "Sub_metering_3"), lines(x,y3, type="l", col="blue"))
        
        legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(x,c, type="l", xlab="datetime",ylab="global_rective_power )
})
dev.off()


## Complete!     