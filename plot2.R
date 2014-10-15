Power<-read.table("household_power_consumption.txt",sep=";",skip=1)
colnames(Power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sample<-subset(Power,Power$Date=="2/2/2007"|Power$Date=="2/1/2007")


##Making the first plot: Histogram of Global_active_power

gap<-as.numeric(levels(droplevels(sample$Global_active_power)))
hist(gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()


##Making the second plot: Histogram of Global_active_power

f<-paste(sample$Date,sample$Time)
newTime<-as.POSIXct(f, format = "%m/%d/%Y %H:%M:%S")
plot(newTime,sample$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()

##Making the third plot: Energy sub metering

plot(newTime,sample$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",ylim=range(0:50),col="black")
lines(newTime,sample$Sub_metering_2,type="l",col="red")
lines(newTime,sample$Sub_metering_3,type="l",col="blue")
lines(newTime,sample$Sub_metering_1,type="l",col="black")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1)) 
dev.copy(png,file="plot3.png")
dev.off()

##Making the fourth plot:

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
 






