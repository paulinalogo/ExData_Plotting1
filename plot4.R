# Set working directory and import database
setwd("C:\\Users\\PaulinaLG\\Documents\\Data_science\\Exploratory Data Analysis\\ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Change to date format
data$date2 <- as.Date(data$Date, format="%d/%m/%Y")

#Subset to keep relevant observations
data_restrict <- subset(data, data$date2=="2007-02-01" | data$date2=="2007-02-02" )

data_restrict$date_time <- strptime(paste(data_restrict$Date, data_restrict$Time),format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL","English")

#plot
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#1st graph
plot(data_restrict$date_time,data_restrict$Global_active_power,xlab="",ylab="Global Active Power",main="",type="n")
lines(data_restrict$date_time,data_restrict$Global_active_power)

#2nd graph
plot(data_restrict$date_time,data_restrict$Voltage,xlab="datetime",ylab="Voltage",main="",type="n")
lines(data_restrict$date_time,data_restrict$Voltage)

#3rd graph
plot(data_restrict$date_time,data_restrict$Sub_metering_1,xlab="",ylab="Enery sub metering",main="",type="n")
lines(data_restrict$date_time,data_restrict$Sub_metering_1,col="black")
lines(data_restrict$date_time,data_restrict$Sub_metering_2,col="red")
lines(data_restrict$date_time,data_restrict$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#4th graph
plot(data_restrict$date_time,data_restrict$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",main="",type="n")
lines(data_restrict$date_time,data_restrict$Global_reactive_power)

dev.off()