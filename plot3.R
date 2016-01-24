## exploratory data anayltics - week 1 assignment 1

## OPTIONAL: set correct working directory
##setwd("directory")

data2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## toggle between showing figure (FALSE) or saving figure (TRUE)
SAVE = TRUE

## define identifiers to select for both 01/02/2007 and 02/02/2007
select_ids <- which(data2$Date == "1/2/2007" | data2$Date == "2/2/2007")

## select data 
data3 <- data2[select_ids, 1:9]

## transform factor data to Date and Time data formats inside dataframe
data3$Date <- as.Date(data3$Date)
data3$Time <- strptime(data3$Time, format = "%H:%M:%S")

## line plot of sub_metering
if(SAVE) png(file="Plot3.png", width = 480, height = 480)
plot({1:length(data3$Global_active_power)}, data3$Sub_metering_1, type = "l", xaxt = "n", col = "black", main = NULL, ylab = "Energy sub metering", xlab = "")
lines({1:length(data3$Global_active_power)}, data3$Sub_metering_2, xaxt = "n", col = "red")
lines({1:length(data3$Global_active_power)}, data3$Sub_metering_3, xaxt = "n", col = "blue")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))

## add legend
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'blue', 'red'), bty=1, cex=0.75)
if(SAVE) dev.off()

