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

#Plot2
with(subsetdata, plot(SetTime, Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type = "l" ))
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()
