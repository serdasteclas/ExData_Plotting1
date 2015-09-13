plot1 <- function() {
    #reads the data
    allData <- read.table("household_power_consumption.txt", header=TRUE,sep = ";")
    #parse date
    allData[,"Date"] <- as.Date(allData[,"Date"],"%d/%m/%Y")
    #gets the useful part of the dataset
    day1 <- as.Date("2007-02-01")
    day2 <- as.Date("2007-02-02")
    plotData <- allData[allData$Date == day1 | allData$Date == day2,]
    
    #parse data as numeric for plotting
    plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
    
    #plot
    png(filename = "plot1.png",width = 480, height = 480)
    hist(plotData$Global_active_power,col = 2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
}