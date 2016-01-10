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
png(filename="plot2.png",width=480,height=480)
plot(data_restrict$date_time,data_restrict$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",main="",type="n")
lines(data_restrict$date_time,data_restrict$Global_active_power)
dev.off()