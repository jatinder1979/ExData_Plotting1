# To create plot 3: Submetering vs. datetimezones
library("data.table")
setwd("~/data/")
# Reads in the data

powdata <- data.table::fread(input="household_power_consumption.txt",na.strings="?")

#using POSIXCT as timezones are needed along with date

powdata[,dateTime := as.POSIXct(paste(Date,Time), format ="%d/%m/%Y %H:%M:%S")]

#Filter dates 

sub_data <- powdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

#Plot

plot(sub_data[,dateTime], sub_data[,Sub_metering_1],type="l",xlab="",ylab="Energy sub metering") 
lines(sub_data[,dateTime], sub_data[,Sub_metering_2],col="red")
lines(sub_data[,dateTime], sub_data[,Sub_metering_3],col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1),lwd=c(1,1))
dev.off()
