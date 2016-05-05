## Read the data file from working directory: only records from 1-2-2007 to 2-2-2007 (skipping header)
power_consumption <- read.table("household_power_consumption.txt",header = FALSE, sep=";",skip=66637 ,nrows=2880,na.strings="?")
## Read the header and adjust variable names
vairable_names<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=1)
colnames(power_consumption)<- colnames(vairable_names)
## Convert Date and Time to Date and Time classes
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Time<-paste(power_consumption$Date,power_consumption$Time)
power_consumption$Time<-strptime(power_consumption$Time,"%Y-%m-%d %H:%M:%S")

##Plot graph 2
with(power_consumption,plot(Time,Global_active_power, type="l",ylab="Global Active Power(kilowatts)",xlab=""))
dev.copy(png, file = "plot2.png") 
dev.off()
