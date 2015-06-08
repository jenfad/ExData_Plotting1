##read and subset the data
house<-read.table("household_power_consumption.txt", header=TRUE, sep= ";")
Thu_Fri<-house[house$Date=="1/2/2007" | house$Date=="2/2/2007",]
##combine date and time and format so R recognizes as time
date_time<-paste(Thu_Fri$Date, Thu_Fri$Time, sep = " ")
Thu_Fri <- cbind(Thu_Fri, date_time)
Thu_Fri$date_time<-as.POSIXlt(Thu_Fri$date_time, format="%d/%m/%Y %H:%M:%S")

##Plot and save as png file
Thu_Fri$Global_active_power <-as.numeric (Thu_Fri$Global_active_power)
plot(Thu_Fri$date_time, Thu_Fri$Global_active_power, type = "l", ylab = "Global Active Power(kW)", xlab = "")
dev.copy(png, file = "plot2.png")
##Close png device
dev.off()