# Opening full dataset
datafile <- read.table("household_power_consumption.txt", header=T, sep=";", 
                       na.strings="?")

# Converting dates
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

# Subsetting dataset to only the two days considered in the project
daterange <- datafile[(datafile$Date=="2007-02-01") | (datafile$Date=="2007-02-02"),]

# Creating Plot 1
hist(daterange$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving Plot 1 as PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()