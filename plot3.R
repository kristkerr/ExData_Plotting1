###############################################################################
f<-file.path(getwd(), "household_power_consumption.txt")
colNames<-c("Date", "Time", "Global_active_power", 
            "Global_reactive_power", "Voltage", "Global_intesity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
HPC<-read.table(f, sep = ";", col.names= colNames, na.strings = "?", 
                header = TRUE, skip = 66636, nrow = 2880)
library(lubridate)
date<-dmy(HPC$Date)
HPC$Date<-date
HPC$dateTime<-as.POSIXct(paste(HPC$Date, HPC$Time), format="%Y-%m-%d %H:%M:%S")
plot(HPC$dateTime, HPC$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     type = "l")
lines(HPC$dateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$dateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = c(1, 1, 1))
