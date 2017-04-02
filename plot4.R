plot4 <- function( ) {
    
    myfile <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";")
    myfile$Date <- as.Date(myfile$Date, "%d/%m/%Y")
    myfile_sub <- myfile[myfile$Date == "2007-02-01" | myfile$Date == "2007-02-02",]
    myfile_sub$Global_active_power <- as.numeric(as.character(myfile_sub$Global_active_power))
    myfile_sub$Sub_metering_1 <- as.numeric(as.character(myfile_sub$Sub_metering_1))
    myfile_sub$Sub_metering_2 <- as.numeric(as.character(myfile_sub$Sub_metering_2))
    myfile_sub$Sub_metering_3 <- as.numeric(as.character(myfile_sub$Sub_metering_3))
    myfile_sub$Global_reactive_power <- as.numeric(as.character(myfile_sub$Global_reactive_power))
    myfile_sub$Voltage <- as.numeric(as.character(myfile_sub$Voltage))
   
    png(file = "Plot4.png")
    par(mfcol = c(2, 2))
## Plot 1
    
    plot(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Global_active_power, type = "n", col = "black", ylab = "Global Active Power (kilowatts)", main = " ", xlab = " ")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Global_active_power)
    
    
## Plot 2
    plot(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_1, type = "n", ylab = "Engergy Sub Metering", main = " ", xlab = " ")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_1, col = "black")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_2, col = "red")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_3, col = "blue")
    legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 3   
    plot(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Voltage, type = "n", col = "black", ylab = "Voltage", main = " ", xlab = " ")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Voltage)
    
    
## Plot 4    
    plot(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Global_reactive_power, type = "n", col = "black", ylab = "Global Reactive Power", main = " ", xlab = " ")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Global_reactive_power)
    
     dev.off()
    }