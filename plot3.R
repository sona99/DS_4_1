plot3 <- function( ) {
    
    
    myfile <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";")
    myfile$Date <- as.Date(myfile$Date, "%d/%m/%Y")
    myfile_sub <- myfile[myfile$Date == "2007-02-01" | myfile$Date == "2007-02-02",]
    myfile_sub$Sub_metering_1 <- as.numeric(as.character(myfile_sub$Sub_metering_1))
    myfile_sub$Sub_metering_2 <- as.numeric(as.character(myfile_sub$Sub_metering_2))
    myfile_sub$Sub_metering_3 <- as.numeric(as.character(myfile_sub$Sub_metering_3))
    png(file = "Plot3.png")
    par(mfrow = c(1, 1))
    plot(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_1, type = "n", ylab = "Engergy Sub Metering", main = " ", xlab = " ")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_1, col = "black")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_2, col = "red")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Sub_metering_3, col = "blue")
    legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    }