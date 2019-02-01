rm(list=ls())
data=read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, na.strings = "?")
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
datetime=mapply(function(x,y){paste(x,y, sep = " ")}, data$Date,data$Time)
names(datetime)=NULL
data=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]




png("plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", main = "Global Active Power",ylim=c(0,1200), col="red")

dev.off()




