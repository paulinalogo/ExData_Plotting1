# Set working directory and import database
setwd("C:\\Users\\PaulinaLG\\Documents\\Data_science\\Exploratory Data Analysis\\ExData_Plotting1")
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Change to date format
data$date2 <- as.Date(data$Date, format="%d/%m/%Y")

#Subset to keep relevant observations
data_restrict <- subset(data, data$date2=="2007-02-01" | data$date2=="2007-02-02" )

#histogram

png(filename="plot1.png",width=480,height=480)
hist(data_restrict$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()