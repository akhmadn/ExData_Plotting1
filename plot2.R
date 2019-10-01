
#install.packages("sqldf")

require(sqldf)
library(lattice)

# Read CSV into R, date = 1/2/2007 and date = 2/2/2007
df <- read.csv.sql("coursera/household_power_consumption.txt", "select *, strftime('%d/%m/%Y', Date) as DateFormated from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")
#head(df)

# convert Date, Format %d/%m/%Y
df$DateFormated <- strptime(df$Date, '%d/%m/%Y')

# Convert date to weekday name
#df$Dayname <- weekdays(df$DateFormated, abbreviate = TRUE)

# construct date time 
df$dttime <- paste(df$Date,df$Time)
df$dttime <- strptime(df$dttime, '%d/%m/%Y %H:%M:%S')
#df$dttime 

# Create png File 
png("plot2.png" )

# Graph 
with(df, plot(dttime, Global_active_power,type = "l", main = "", xlab = "", ylab = "Global Active Power (killowatts)", col="black"))

# close device
dev.off()
