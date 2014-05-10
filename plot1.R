## Household Power Consumption Peer Assignment, Plot 1
## ./electric/household_power_consumption.txt
## Anahita Saghafi 10/05/2014
##--------------------------------------------------------------------        
 
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

        
        DF <- powerData[c(powerData$Date=="1/2/2007",powerData$Date =="2/2/2007"),]

## Plotting ...

        library(datasets)
        
        ##DF[,3]=as.numeric(DF[,3])
       DF[,3] = as.numeric(as.character(DF[,3]))
        x<- DF$Global_active_power
        
        png("plot1.png", width = 480, height = 480)
        hist(x, main = "Global Active Power", col = "red", xlab = "Global Active Power(Kilowatts)")
        dev.off()
 
## Complete!        
            