setInternet2(TRUE) 
##Download dataset
setwd("~/GitHub/Data_Science_JHU/Exp_Data_Analysis/ExData_Plotting")
datafile = "projfile1.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = datafile); unzip(datafile)

hpcon<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcon$Date <- as.Date(hpcon$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(hpcon, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpcon)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plot3
setwd("~/GitHub/Data_Science_JHU/Exp_Data_Analysis/ExData_Plotting/figure")
png("plot3.png", width=480, height= 480)

with(data, {  
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,      
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
))

dev.off()
