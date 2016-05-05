## Read the data file from working directory: only records from 1-2-2007 to 2-2-2007 (skipping header)
power_consumption <- read.table("household_power_consumption.txt",header = FALSE, sep=";",skip=66637 ,nrows=2880,na.strings="?")
## Read the header and adjust variable names
vairable_names<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=1)
colnames(power_consumption)<- colnames(vairable_names)
## Convert Date and Time to Date and Time classes
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption$Time<-paste(power_consumption$Date,power_consumption$Time)
power_consumption$Time<-strptime(power_consumption$Time,"%Y-%m-%d %H:%M:%S")

##Plot graph 1 (Histogram)
with(power_consumption,hist(Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)"))
dev.copy(png, file = "plot1.png") 
dev.off()