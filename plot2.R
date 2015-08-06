# Opening full dataset
datafile <- read.table("household_power_consumption.txt", header=T, sep=";", 
                       na.strings="?")

# Converting dates
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

# Subsetting dataset to only the two days considered in the project
daterange <- datafile[(datafile$Date=="2007-02-01") | (datafile$Date=="2007-02-02"),]

# Converting dates
datetime <- paste(as.Date(daterange$Date), daterange$Time)
daterange$Datetime <- as.POSIXct(datetime)

# Creating Plot 2
plot(daterange$Global_active_power~daterange$Datetime, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

# Saving Plot 2 as PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()