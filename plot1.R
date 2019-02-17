# To create plot 1: Global Active Power vs. Frequency
library("data.table")
setwd("~/data/")
# Reads in the data

powdata <- data.table::fread(input="household_power_consumption.txt",na.strings="?")

#change data column to Date type

powdata[,Date := lapply(.SD, as.Date,"%d/%m/%Y"), .SDcols=c("Date")]

#Filter date for 2007-02-01 and 2007-02-02


sub_data <- powdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#plot 

png("plot1.png", width=480, height=480)

hist(sub_data[,Global_active_power],main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col= "red")

dev.off()