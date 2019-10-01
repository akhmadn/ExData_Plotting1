
#install.packages("sqldf")

require(sqldf)
library(lattice)

# Read CSV into R, date = 1/2/2007 and date = 2/2/2007
df <- read.csv.sql("coursera/household_power_consumption.txt", "select *, strftime('%d/%m/%Y', Date) as DateFormated from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")
head(df)

# convert Date, Format %d/%m/%Y
df$DateFormated <- strptime(df$Date, '%d/%m/%Y')

# Convert date to weekday name
#df$Dayname <- weekdays(df$DateFormated, abbreviate = TRUE)

# construct date time 
df$dttime <- paste(df$Date,df$Time)
df$dttime <- strptime(df$dttime, '%d/%m/%Y %H:%M:%S')
#df$dttime 


# Create png File 
png("plot4.png" )

# 2 rows and 2 column
par(mfrow=c(2,2))

# graph 1 
with(df, plot(dttime, Global_active_power,type = "l", main = "", xlab = "", ylab = "Global Active Power (killowatts)", col="black"))

# graph 2
with(df, plot(dttime, Voltage, type = "l", main = "", xlab = "datetime", 
              ylab = "Voltage", col="black"))

# graph 3
with(df, plot(dttime, Sub_metering_1,type = "l", main = "", xlab = "", 
              ylab = "Energy sub metering", col="black"))
with(df, lines(dttime, Sub_metering_2,type = "l", col="red"))
with(df, lines(dttime, Sub_metering_3,type = "l", col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", 
                                                  "Sub_metering_3  "), lty=c(1,1), lwd=c(1,1), cex=.8 )

# graph 4
with(df, plot(dttime, Global_reactive_power, type = "l", main = "", xlab = "datetime", 
              ylab = "Global_reactive_power", col="black"))

# close device
dev.off()

