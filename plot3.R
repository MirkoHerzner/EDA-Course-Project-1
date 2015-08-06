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

# Creating Plot 3
with(daterange, {plot(Sub_metering_1~Datetime, type="l", xlab="", 
                      ylab="Energy sub metering")
                 lines(Sub_metering_2~Datetime, col="Red")
                 lines(Sub_metering_3~Datetime, col="Blue")
})

# Creating legend for Plot 3
legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving Plot 3 as PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()