#Read File
household_data<-read.csv('household_power_consumption.txt',sep =";",na.strings="?")

#get datetime format
filtered_data<- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
filtered_data$Date <- as.Date(filtered_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(filtered_data$Date), filtered_data$Time)
filtered_data$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2),mar=c(4,4,2,1))

#Figure 1
with(filtered_data, {
  plot(Global_active_power~Datetime,type="l",ylab="Global Active Power", xlab="",cex.lab = 0.8)
})

#Figure 2
with(filtered_data,{
  plot(Voltage~Datetime,type = "l", ylab = "Voltage", xlab="datetime",cex.lab = 0.8)
})

#Figure 3
with(filtered_data, {
  plot(Sub_metering_1~Datetime,type = "l",ylab="Energy sub metering", xlab="",cex.lab = 0.8)
})
with(filtered_data, {
  lines(Sub_metering_2~Datetime,type = "l",col = "Red")
})
with(filtered_data, {
  lines(Sub_metering_3~Datetime,type = "l",col = "Blue")
})
legend("topright",lty=1 ,bty="n",cex = 0.8,col = c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Figure 4
with(filtered_data, {
  plot(Global_reactive_power~Datetime,type = "l", ylab = "Global_reactive_power", xlab = "datetime",cex.lab = 0.8)
})


#copy plot to png format

dev.copy(png, "plot4.png")
dev.off(
  
)

