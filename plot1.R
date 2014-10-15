Power<-read.table("household_power_consumption.txt",sep=";",skip=1)
colnames(Power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sample<-subset(Power,Power$Date=="2/2/2007"|Power$Date=="2/1/2007")


##Making the first plot: Histogram of Global_active_power

gap<-as.numeric(levels(droplevels(sample$Global_active_power)))
hist(gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()


##Making the second plot: Histogram of Global_active_power

newTime<-as.POSIXct(f, format = "%m/%d/%Y %H:%M:%S")
plot(newTime,sample$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
 






