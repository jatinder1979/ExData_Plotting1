# To create plot 4: Panels of plots
library("data.table")
setwd("~/data/")
# Reads in the data

powdata <- data.table::fread(input="household_power_consumption.txt",na.strings="?")

#using POSIXCT as timezones are needed along with date

powdata[,dateTime := as.POSIXct(paste(Date,Time), format ="%d/%m/%Y %H:%M:%S")]

#Filter dates 

sub_data <- powdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

#mfrow parameter to create panels
par(mfrow=c(2,2))

#plot 1
plot(x=sub_data[,dateTime],y =sub_data[,Global_active_power], type="l", xlab="", ylab="Global Active Power")

#plot 2
plot(x=sub_data[,dateTime],y =sub_data[,Voltage], type="l", xlab="datetime", ylab="Voltage")

#plot 3
plot(sub_data[,dateTime], sub_data[,Sub_metering_1],type="l",xlab="",ylab="Energy sub metering") 
lines(sub_data[,dateTime], sub_data[,Sub_metering_2],col="red")
lines(sub_data[,dateTime], sub_data[,Sub_metering_3],col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1),bty="n",cex=.5)

#plot 4

plot(x=sub_data[,dateTime],y =sub_data[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
