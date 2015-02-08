###Load the required Pkgs
require(sqldf)
### Read the data fule and subset, remove any NAs
file <- c("C:\\Users\\Venkat_Khammampadu\\Documents\\coursera\\Exploratory_Data_Analysis\\Course Project 1\\data\\household_power_consumption.txt")
mydata <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
mydata[mydata =="?"] <- NA

### Convert the Date and Time to datetime and add as new column to the dataframe
mydata$datetime<-as.POSIXct(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S")

###Start plotting away........

##### Plot 4
png(file="plot4.png", width = 480, height = 480,units = "px",bg = "transparent")
x <- mydata$datetime
y1 <- mydata$Global_active_power
y2 <- mydata$Voltage
y3 <- mydata$Global_reactive_power
y4 <- mydata$Sub_metering_1
y5 <- mydata$Sub_metering_2
y6 <- mydata$Sub_metering_3
par(mfrow=c(2,2),mar=c(4,4,1,1))
plot(x,y1, type="l", xlab="", ylab="Global Active Power",cex.axis =1,cex.lab =1)
plot(x,y2, type="l", xlab="datetime", ylab="Voltage",cex.axis =1,cex.lab =1)
plot(x,y4, type="n", xlab="", ylab="Energy sub metering",cex.axis =1,cex.lab =1)
points(x,y4,col="black",type="l" )
points(x,y5,col="red",type="l" )
points(x,y6,col="blue",type="l" )
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pch="",col=c("black","red","blue"), merge=TRUE,bg = "transparent",lty=1,bty="n",cex =1)
plot(x,y3, type="l", xlab="datetime", ylab="Global_reactive_power",cex.axis =1,cex.lab =1)
dev.off()

