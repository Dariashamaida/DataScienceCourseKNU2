headers = read.table("household_power_consumption.txt",header = F, nrows = 1, as.is = T, sep=";")

two_days<-read.table(skip=66636, nrows=2880, "household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
colnames(two_days)= headers

two_days$DateTime<-paste(two_days$Date, two_days$Time)
two_days$DateTime<-strptime(two_days$DateTime, "%d/%m/%Y %H:%M:%S")
two_days$Date<-as.Date(two_days$Date, "%d/%m/%Y")


plot(two_days$DateTime, 
    two_days$Sub_metering_1, type = "l", 
    xlab = "", 
    ylab = "Energy sub metering")
    lines(two_days$DateTime, two_days$Sub_metering_2, type = "l", col = "red")
    lines(two_days$DateTime, two_days$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
