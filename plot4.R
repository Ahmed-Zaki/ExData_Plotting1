## Read the data file from working directory: only records from 1-2-2007 to 2-2-2007 (skipping header)
power_consumption <- read.table("household_power_consumption.txt",header = FALSE, sep=";",skip=66637 ,nrows=2880,na.strings="?")
## Read the header and adjust variable names
vairable_names<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=1)
colnames(power_consumption)<- colnames(vairable_names)
## Convert Date and Time to Date and Time classes
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Time<-paste(power_consumption$Date,power_consumption$Time)
power_consumption$Time<-strptime(power_consumption$Time,"%Y-%m-%d %H:%M:%S")

##Plot graph 4
# Initialize png graphics device
png(file = "plot4.png")
# Set the plotting area 2x2
par(mfrow=c(2,2), mar=c(4,4,4,2))
# Plot first grapgh
with(power_consumption,plot(Time,Global_active_power, type="l",ylab="Global Active Power",xlab=""))
# Plot second graph
with(power_consumption,plot(Time,Voltage, type="l",ylab="Voltage",xlab="datetime"))
# Plot third graph
with(power_consumption,plot(Time,Sub_metering_1, type="n",ylab="Energy sub metering",xlab=""))
with(power_consumption,lines(Time,Sub_metering_1))
with(power_consumption,lines(Time,Sub_metering_2,col="red"))
with(power_consumption,lines(Time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"),bty="n")
# Plot the fourth graph 
with(power_consumption,plot(Time,Global_reactive_power, type="l",xlab="datetime"))
# Close graphics device
dev.off()
