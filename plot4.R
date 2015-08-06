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

# Creating Plot 4
par(mfrow=c(2,2))
with(daterange, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=.5,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_reactive_power", xlab="datetime")
})

# Saving Plot 4 as PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()