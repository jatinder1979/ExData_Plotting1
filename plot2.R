# To create plot 1: Global Active Power vs. Frequency
library("data.table")
setwd("~/data/")
# Reads in the data

powdata <- data.table::fread(input="household_power_consumption.txt",na.strings="?")

#using POSIXCT as timezones are needed along with date

powdata[,dateTime := as.POSIXct(paste(Date,Time), format ="%d/%m/%Y %H:%M:%S")]

#Filter dates 

sub_data <- powdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

#Plot

plot(x=sub_data[,dateTime],y =sub_data[,Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#Filter date for 2007-02-01 and 2007-02-02


sub_data <- powdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#plot 

png("plot1.png", width=480, height=480)

hist(sub_data[,Global_active_power],main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col= "red")

dev.off()