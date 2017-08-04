###############################################################################
# Exploratory Data Analysis Project 1
# Plot 4

# Create a file path to be read and a vector column names for the data frame.
f<-file.path(getwd(), "household_power_consumption.txt")
colNames<-c("Date", "Time", "Global_active_power", 
            "Global_reactive_power", "Voltage", "Global_intesity", 
            "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read only the data for 2-1-2007 and 2-2-2007
HPC<-read.table(f, sep = ";", col.names= colNames, na.strings = "?", 
                header = TRUE, skip = 66636, nrow = 2880)

# Load the lubridate package and recreate the date column in the best format. 
library(lubridate)
date<-dmy(HPC$Date)
HPC$Date<-date

# Combine the date and time into one column. 
HPC$dateTime<-as.POSIXct(paste(HPC$Date, HPC$Time), format="%Y-%m-%d %H:%M:%S")

# Set the 2x2 format for the graphs. 
par(mfrow = c(2,2))

# Create a line graph of the Golbal active power by the dateTime. 
plot(dateTime, HPC$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Create a line graph of Voltage by dateTime.
plot(HPC$dateTime, HPC$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Create a line graph of the Sub metering 1 column by the dateTime
plot(HPC$dateTime, HPC$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     type = "l")

# Add a line for Sub metering 2 in red and sub metering 3 in blue.
lines(HPC$dateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$dateTime, HPC$Sub_metering_3, col = "blue")

#Add a legend to the top right corner. 
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")


#Create a line graph of Global reactive power by datetime. 
plot(HPC$dateTime, HPC$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")