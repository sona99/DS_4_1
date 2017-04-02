plot2 <- function( ) {
    
    
    myfile <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";")
    myfile$Date <- as.Date(myfile$Date, "%d/%m/%Y")
    myfile_sub <- myfile[myfile$Date == "2007-02-01" | myfile$Date == "2007-02-02",]
    myfile_sub$Global_active_power <- as.numeric(as.character(myfile_sub$Global_active_power))
    png(file = "Plot2.png")
    par(mfrow = c(1, 1))
    plot(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Global_active_power, type = "n", col = "black", ylab = "Global Active Power (kilowatts)", main = " ", xlab = " ")
    lines(as.POSIXct(paste(myfile_sub$Date, myfile_sub$Time)), myfile_sub$Global_active_power)
    dev.off()
}