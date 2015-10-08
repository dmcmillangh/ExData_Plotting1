require(dplyr)
require(lubridate)
require(data.table)

dt<-fread("household_power_consumption.txt",na.strings="?",nrows=75000)
dt<-mutate(dt,Date=dmy(Date))
dt<-mutate(dt,Datetm=Date+hms(Time))

dt2<-filter(dt,Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))

rm(dt)

png(file="plot4.png")

##Plot 4
#set up 2x2 grid for single page
par(mfcol=c(2,2),ps=8)

##plot 1/4
plot(y=dt2$Global_active_power,x=dt2$Datetm,xlab="",ylab="Global Active Power",type="l")

##Plot 2/4
plot(y=dt2$Sub_metering_1,x=dt2$Datetm,xlab="",ylab="Global Active Power",type="n")
points(y = dt2$Sub_metering_1,x=dt2$Datetm,col='darkgray',type='l',pch=0)
points(y = dt2$Sub_metering_2,x=dt2$Datetm,col='red',type='l',pch=0)
points(y = dt2$Sub_metering_3,x=dt2$Datetm,col='blue',type='l',pch=0)
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("darkgray","red","blue"),lwd = c(2,2,2))

##plot 3/4
plot(y=dt2$Voltage,x=dt2$Datetm,xlab="",ylab="Voltage",type="l")

##plot 4/4
plot(y=dt2$Global_reactive_power,x=dt2$Datetm,xlab="",ylab="Global Reactive Power",type="l")

dev.off()




