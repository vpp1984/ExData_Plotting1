png(filename = "plot2.png",
    width = 480, height = 480)

##Read dataset
data1 <- read.table("household_power_consumption.txt", sep=";",  header=TRUE, na.strings = "?"
                    ,colClasses=c("character", "character",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric"))

##create data variable from character date variable
data1$dt <-  as.Date(data1$Date, "%d/%m/%Y") ## create date variable from character date variable

## Subset data to keep only data for two dates : 01-02-2007 & 02-02-2007
data2 <- subset(data1, dt >= as.Date("2007-02-01") & dt <= as.Date("2007-02-02")) 

## Create datetime variable from Date and Time variable
data2$dtm <- as.POSIXlt(paste(as.Date(data2$Date,format="%d/%m/%Y"), data2$Time))

## Weekdays variable
data2$week <- weekdays(data2$dt)

## Generate Plot 
plot(data2$dtm, data2$Global_active_power, type='n', ylab="Global Active Power (kilowatts)", xlab="")
lines(data2$dtm, data2$Global_active_power)
dev.off()
