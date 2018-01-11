
## download, unzip and read household_power_consumption file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=url,destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
file = "household_power_consumption.txt"
HPC<-read.delim(file, header = TRUE, sep = ";", na.strings = "?")
str(HPC)

## retain only data for 2 dates : 1-2 feb 2007, convert factors to date and time variables

HPC <- HPC[grep("^(1/2/2007|2/2/2007)$",HPC$Date),]

HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC$Time <- strptime(HPC$Time, format = "%H:%M:%S")

# Plot 1

hist(HPC$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.copy(png,"Plot1.png")
dev.off()



