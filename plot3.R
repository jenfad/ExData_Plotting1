##read and subset the data
house<-read.table("household_power_consumption.txt", header=TRUE, sep= ";")
Thu_Fri<-house[house$Date=="1/2/2007" | house$Date=="2/2/2007",]
##combine date and time and format so R recognizes as time
date_time<-paste(Thu_Fri$Date, Thu_Fri$Time, sep = " ")
Thu_Fri <- cbind(Thu_Fri, date_time)
Thu_Fri$date_time<-as.POSIXlt(Thu_Fri$date_time, format="%d/%m/%Y %H:%M:%S")

##Plot and save as png file
with(Thu_Fri, plot(date_time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(Thu_Fri, lines(date_time, Sub_metering_2, col = "red"))
with(Thu_Fri, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", pch = 3, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
##Close png device
dev.off()