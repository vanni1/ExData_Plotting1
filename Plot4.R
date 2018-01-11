
## download, unzip and read household_power_consumption file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=url,destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
file = "household_power_consumption.txt"
HPC<-read.delim(file, header = TRUE, sep = ";", na.strings = "?")
str(HPC)

## retain only data for 2 dates : 1-2 feb 2007, convert factors to a date-time variable

HPC <- HPC[grep("^(1/2/2007|2/2/2007)$",HPC$Date),]
HPC$datetime <- strptime(paste(as.character(HPC$Date),as.character(HPC$Time),sep=" "),format="%d/%m/%Y %H:%M:%S")


# Plot 4

par(mfrow = c(2,2))

with(HPC,plot(datetime,Global_active_power,type="n",ylab = "Global Active Power", xlab=""))
with(HPC,lines(datetime,Global_active_power))

with(HPC,plot(datetime,Voltage,type="n"))
with(HPC,lines(datetime,Voltage))

with(HPC,plot(datetime,Sub_metering_1+Sub_metering_2+Sub_metering_3,type="n",ylab = "Energy sub metering", ylim = c(0,38), xlab=""))
with(HPC,lines(datetime,Sub_metering_3,col="blue"))
with(HPC,lines(datetime,Sub_metering_2,col="red"))
with(HPC,lines(datetime,Sub_metering_1,col="black"))
legend("top", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), bty="n")



with(HPC,plot(datetime,Global_reactive_power,type="n"))
with(HPC,lines(datetime,Global_reactive_power))


dev.copy(png,"Plot4.png")
dev.off()



