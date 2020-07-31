
#Read File
household_data<-read.csv('household_power_consumption.txt',sep =";",na.strings="?")

#head(household_data)

#get datetime format
filtered_data<- subset(household_data, Date %in% c("1/2/2007","2/2/2007"))
filtered_data$Date <- as.Date(filtered_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(filtered_data$Date), filtered_data$Time)
filtered_data$Datetime <- as.POSIXct(datetime)

#plot graph
with(filtered_data, {
  plot(Global_active_power~Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
})

#copy graph to png format
dev.copy(png,"plot2.png")
dev.off()

