## exploratory data anayltics - week 1 assignment 1

## OPTIONAL: set correct working directory
##setwd("directory")

data2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## toggle between saving figure (TRUE) or showing figure on screen (FALSE)
SAVE = TRUE

## define identifiers to select for both 01/02/2007 and 02/02/2007
select_ids <- which(data2$Date == "1/2/2007" | data2$Date == "2/2/2007")

## select data 
data3 <- data2[select_ids, 1:9]

## transform factor data to Date and Time data formats inside dataframe
data3$Date <- as.Date(data3$Date)
data3$Time <- strptime(data3$Time, format = "%H:%M:%S")

## line plot of global active power
## type "l" = line plot, xact = "n" to remove automatic ticks at x-axis
if(SAVE) png(file="Plot2.png", width = 480, height = 480)
plot({1:length(data3$Global_active_power)}, data3$Global_active_power, type = "l", xaxt = "n", main = NULL, ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
if(SAVE) dev.off()