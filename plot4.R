plot4 <- function() {
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
    plotData$Global_reactive_power <- as.numeric(plotData$Global_reactive_power)
    plotData$Voltage <- as.numeric(plotData$Voltage)
    plotData$Sub_metering_1 <- as.numeric(plotData$Sub_metering_1)
    plotData$Sub_metering_2 <- as.numeric(plotData$Sub_metering_2)
    plotData$Sub_metering_3 <- as.numeric(plotData$Sub_metering_3)
    
    #date placement
    amount <- nrow(plotData)
    middle <- amount/2
    
    #plot
    png(filename = "plot4.png",width = 480, height = 480)
    
    par(mfcol = c(2,2))
    
    plot(plotData$Global_active_power,ylab = "Global Active Power (kilowatts)", xlab="",type="l", xaxt="n")
    axis(side = 1, at=c(0,middle,amount), labels = c("Thu", "Fri", "Sat"))
    
    
    plot(plotData$Sub_metering_1,ylab = "Energy sub metering", xlab="",type="l", xaxt="n")
    lines(1:amount,plotData$Sub_metering_2, col="red")
    lines(1:amount,plotData$Sub_metering_3, col="blue")
    axis(side = 1, at=c(0,middle,amount), labels = c("Thu", "Fri", "Sat"))
    legend("topright",pch="-",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    
    plot(plotData$Voltage,ylab = "Voltage", xlab="datetime",type="l", xaxt="n")
    axis(side = 1, at=c(0,middle,amount), labels = c("Thu", "Fri", "Sat"))
    
    
    plot(plotData$Global_reactive_power,ylab = "Global_reactive_power", xlab="datetime",type="l", xaxt="n")
    axis(side = 1, at=c(0,middle,amount), labels = c("Thu", "Fri", "Sat"))
    
    
    dev.off()
}