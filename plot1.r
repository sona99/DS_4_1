plot1 <- function( ) {
    
    
    myfile <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";")
    myfile$Date <- as.Date(myfile$Date, "%d/%m/%Y")
    myfile_sub <- myfile[myfile$Date == "2007-02-01" | myfile$Date == "2007-02-02",]
    myfile_sub$Global_active_power <- as.numeric(as.character(myfile_sub$Global_active_power))
    png(file = "Plot1.png")
    par(mfrow = c(1, 1))
    hist(myfile_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    dev.off()
}