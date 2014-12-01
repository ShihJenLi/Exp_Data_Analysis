setInternet2(TRUE) 

setwd("~/GitHub/Data_Science_JHU/Exp_Data_Analysis/ExData_Plotting")

datafile = "projfile1.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = datafile)

unzip(datafile)
list.files()
hpcon<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcon$Date <- as.Date(hpcon$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(hpcon, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpcon)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

setwd("~/GitHub/Data_Science_JHU/Exp_Data_Analysis/ExData_Plotting/figure")
png("plot1.png", width=480, height= 480)

hist(data$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
