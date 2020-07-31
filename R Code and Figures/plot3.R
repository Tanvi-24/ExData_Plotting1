
#Read file
household_data<-read.csv('household_power_consumption.txt',sep =";",na.strings="?")

#head(household_data)

#get datetime format
filtered_data<- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
filtered_data$Date <- as.Date(filtered_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(filtered_data$Date), filtered_data$Time)
filtered_data$Datetime <- as.POSIXct(datetime)

#plot graphs
with(filtered_data, {
  plot(Sub_metering_1~Datetime,type="l",ylab="Energy sub metering", xlab="",cex.lab = 0.7)
})
with(filtered_data, {
  lines(Sub_metering_2~Datetime,type="l",col = "Red")
})
with(filtered_data, {
  lines(Sub_metering_3~Datetime,type="l",col = "Blue")
})
legend("topright",lty=1,col = c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#copy graph to png format
dev.copy(png,"plot3.png")
dev.off()
