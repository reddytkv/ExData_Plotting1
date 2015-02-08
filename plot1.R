###Load the required Pkgs
require(sqldf)
### Read the data fule and subset, remove any NAs
file <- c("C:\\Users\\Venkat_Khammampadu\\Documents\\coursera\\Exploratory_Data_Analysis\\Course Project 1\\data\\household_power_consumption.txt")
mydata <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
mydata[mydata =="?"] <- NA

### Convert the Date and Time to datetime and add as new column to the dataframe
mydata$datetime<-as.POSIXct(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S")

###Start plotting away........
#####Plot 1
png(filename="plot1.png", width = 480, height = 480,units = "px",bg = "transparent")
hist(mydata$Global_active_power,col="red",main="Gloabl Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
