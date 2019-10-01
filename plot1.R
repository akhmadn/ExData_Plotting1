
#install.packages("sqldf")

require(sqldf)

# Read CSV into R, date = 1/2/2007 and date = 2/2/2007
df <- read.csv.sql("coursera/household_power_consumption.txt", "select *, strftime('%d/%m/%Y', Date) as DateFormated from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# head(df)

# convert Date, Format %d/%m/%Y
#df$DateFormated <- strptime(df$Date, '%d/%m/%Y')
#df$DateFormated <- strptime(df$Date, '%d/%m/%Y')

# Create png File 
png("plot1.png" )

# Graph 
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (killowatts)", col="red")

# close device
dev.off()




