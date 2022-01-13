dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
globalActivePower <- as.numeric(subdat$Global_active_power)

subdat$Date <- as.Date(subdat$Date, format="%d/%m/%Y")
subdat$Time <- strptime(subdat$Time, format="%H:%M:%S")
subdat[1:1440,"Time"] <- format(subdat[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdat[1441:2880,"Time"] <- format(subdat[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow = c(2,2))

with(subdat,{
  plot(subdat$Time,as.numeric(as.character(subdat$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subdat$Time,as.numeric(as.character(subdat$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subdat$Time,subdat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subdat,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subdat,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subdat,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subdat$Time,as.numeric(as.character(subdat$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.copy(png, filename="plot4.png")
dev.off()