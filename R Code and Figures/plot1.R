#Read File
household_data<-read.table('household_power_consumption.txt',sep =";")

#head(household_data)

#Renaming the column name
colnames(household_data)<-unlist(household_data[1,])
head(household_data)
household_data<-household_data[-1,]

#plot histogram
hist(as.numeric(household_data$Global_active_power),col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylab = "Frequency")

#copy file to png format
dev.cur()
dev.copy(png,"plot1.png")
dev.off()