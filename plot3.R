###Load the required Pkgs
require(sqldf)
### Read the data fule and subset, remove any NAs
file <- c("C:\\Users\\Venkat_Khammampadu\\Documents\\coursera\\Exploratory_Data_Analysis\\Course Project 1\\data\\household_power_consumption.txt")
mydata <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
mydata[mydata =="?"] <- NA

### Convert the Date and Time to datetime and add as new column to the dataframe
mydata$datetime<-as.POSIXct(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S")

###Start plotting away........
#####Plot 3
png(file="plot3.png", width = 480, height = 480,units = "px",bg = "transparent")
x <- mydata$datetime
y1 <- mydata$Sub_metering_1
y2 <- mydata$Sub_metering_2
y3 <- mydata$Sub_metering_3
plot(x, y1, type="n", xlab="", ylab="Energy sub metering")
points(x,y1,col="black",type="l" )
points(x,y2,col="red",type="l" )
points(x,y3,col="blue",type="l" )
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pch="",col=c("black","red","blue"), merge=TRUE,bg = "transparent",lty=1)
dev.off()
