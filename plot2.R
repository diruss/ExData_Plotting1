#code to generate plot2
consomation=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
DateTimeFunction=function(x,y) {paste(x,y,sep=" ")}
consomation$Date_Time1=mapply(DateTimeFunction,consomation$Date,consomation$Time)
consomation$Date_Time=strptime(consomation$Date_Time1,format="%d/%m/%Y %H:%M:%S")
consomation$Date=strptime(consomation$Date, format="%d/%m/%Y")
consomation$Global_active_power=as.numeric(consomation$Global_active_power)
consomation$Global_intensity=as.numeric(consomation$Global_intensity)
consomation$Global_reactive_power=as.numeric(consomation$Global_reactive_power)
consomation$Sub_metering_1=as.numeric(consomation$Sub_metering_1)
consomation$Sub_metering_2=as.numeric(consomation$Sub_metering_2)
consomation$Sub_metering_3=as.numeric(consomation$Sub_metering_3)
consomation$Voltage=as.numeric(consomation$Voltage)

consomation=subset(consomation,consomation$Date>as.POSIXlt("2007-01-31") & consomation$Date<as.POSIXlt("2007-02-03"))
png(file="plot2.png",width=480,height=480)
plot(consomation$Date_Time,consomation$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()