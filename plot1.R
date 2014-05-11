## Household Power Consumption Peer Assignment, Plot 1
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

powerData <- read.table("./electric/household_power_consumption.txt", sep=";", header=TRUE)
         
## Subsetting the data frame with the selected dates: "01/02/2007", "02/02/2007"   

      
## Subsetting the data frame with the selected dates: "01/02/2007", "02/02/2007"   

DF1 <- powerData[c(powerData$Date =="1/2/2007"),]
DF2 <- powerData[c(powerData$Date=="2/2/2007"),]

## Binding  the data for two selected dates.

DF <- rbind(DF1,DF2)


## Plotting ...

        library(datasets)
        

        z<- as.numeric(as.character(DF$Global_active_power))
        
        png("plot1.png", width = 480, height = 480)
        hist(z, main = "Global Active Power", col = "red", xlab = "Global Active Power(Kilowatts)")
        dev.off()
 
## Complete!        
            