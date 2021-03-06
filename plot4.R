Power<-read.table("household_power_consumption.txt",sep=";",skip=1)
colnames(Power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sample<-subset(Power,Power$Date=="2/2/2007"|Power$Date=="2/1/2007")

##Making the fourth plot:

f<-paste(sample$Date,sample$Time)
newTime<-as.POSIXct(f, format = "%m/%d/%Y %H:%M:%S")

par(mfrow=c(2,2)) 

plot(newTime,sample$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(newTime,sample$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(newTime,sample$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",ylim=range(0:50),col="black")
lines(newTime,sample$Sub_metering_2,type="l",col="red")
lines(newTime,sample$Sub_metering_3,type="l",col="blue")
lines(newTime,sample$Sub_metering_1,type="l",col="black")

plot(newTime,sample$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()
 






