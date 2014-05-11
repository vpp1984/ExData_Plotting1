
png(filename = "plot1.png",
    width = 480, height = 480)

data1 <- read.table("household_power_consumption.txt", sep=";",  header=TRUE, na.strings = "?"
                ,colClasses=c("character", "character",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric",  "numeric"))
                                                                                  
data1$dt <-  as.Date(data1$Date, "%d/%m/%Y") ## create date variable from character date variable

## Subset data to keep only data for two dates : 01-02-2007 & 02-02-2007
data2 <- subset(data1, dt >= as.Date("2007-02-01") & dt <= as.Date("2007-02-02")) 

## Histogram 
hist(data2$Global_active_power, 
     c="red", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency" , 
     main="Global Active Power")
dev.off()
