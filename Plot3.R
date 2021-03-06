#Downloading the data
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url, destfile = "Power-Consumption.zip")

#Unzip Folder
unzip(zipfile = "Power-Consumption.zip", exdir = "Source data", overwrite = TRUE )

#Read the data
data <- read.table("Source data/household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Set time variable
SetTime <-strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
subsetdata <- cbind(SetTime, subsetdata)


#Plot3
with(subsetdata, plot(SetTime, Sub_metering_1, xlab= "", ylab="Energy sub metering", type = "l"))
lines(SetTime, subsetdata$Sub_metering_2, type = "l", col="red")
lines(SetTime, subsetdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png",width=480, height=480)
dev.off()
