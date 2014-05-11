## Household Power Consumption Peer Assignment, Plot 2
## ./electric/household_power_consumption.txt
## Anahita Saghafi 10/05/2014
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
        y<- as.numeric(as.character(DF$Global_active_power))
        
        ##DF$Day <- weekdays(as.Date(DF$Date))
         

        png("plot2.png", width = 480, height = 480)
        with(DF, plot(x,y, type="l", ylab="Global Active Power(Kilowatts") )
        dev.off()

 
## Complete!        
            