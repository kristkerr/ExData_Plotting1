###############################################################################
# Exploratory Data Analysis Project 1
# Plot 1

# Create a file path and a vector column names for the data frame
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

# Create a red histogram of the Global active power.
hist(HPC$Global_active_power, breaks=12, col = "red", 
     main = "Global Active Power", xlab="Global Active Power (kilowatts)")

#Copy the histogram to a PNG file called plot1 and shut off the connection
dev.copy(png, file = "plot1.png")
dev.off()