dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
globalActivePower <- as.numeric(subdat$Global_active_power)
png("plot2.png")
plot(globalActivePower, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()