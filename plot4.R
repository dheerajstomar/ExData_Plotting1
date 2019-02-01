rm(list=ls())
data=read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, na.strings = "?")
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
datetime=mapply(function(x,y){paste(x,y, sep = " ")}, data$Date,data$Time)
names(datetime)=NULL
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]






data$Weekdays<-weekdays(as.Date(data$Date,'%d/%m/%Y'))


size=nrow(data)

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

#LeftTop
plot(data$Global_active_power,xaxt="n",xlab="", ylab="Global Active Power (kilowatts)", type="l")
axis(1, at=c(0,size/2,size), labels=c("Thursday", "Friday", "Saturday"))
#RightTop
plot(data$Voltage,xaxt="n",xlab="datetime", ylab="Voltage", type="l")
axis(1, at=c(0,size/2,size), labels=c("Thursday", "Friday", "Saturday"))
#LeftBottom
plot(data$Sub_metering_1,xaxt="n",xlab="", ylab="Global Active Power (kilowatts)", type="l")
axis(1, at=c(0,size/2,size), labels=c("Thursday", "Friday", "Saturday"))
lines(data$Sub_metering_2,xaxt="n",xlab="", ylab="Global Active Power (kilowatts)", type="l", col="red")
lines(data$Sub_metering_3,xaxt="n",xlab="", ylab="Energy sub metering", type="l", col="blue")
legend(0.40*size,35,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)
#RightBottom
plot(data$Global_reactive_power,xaxt="n",xlab="", type="l")
axis(1, at=c(0,size/2,size), labels=c("Thursday", "Friday", "Saturday"))
#
dev.off()



