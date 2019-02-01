rm(list=ls())
data=read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, na.strings = "?")
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
datetime=mapply(function(x,y){paste(x,y, sep = " ")}, data$Date,data$Time)
names(datetime)=NULL
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]






data$Weekdays<-weekdays(as.Date(data$Date,'%d/%m/%Y'))


size=nrow(data)

png("plot2.png", width = 480, height = 480, units = "px")

plot(data$Global_active_power,xaxt="n",xlab="", ylab="Global Active Power (kilowatts)", type="l")

axis(1, at=c(0,size/2,size), labels=c("Thursday", "Friday", "Saturday"))

dev.off()



