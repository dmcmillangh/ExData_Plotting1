require(dplyr)
require(lubridate)
require(data.table)

dt<-fread("household_power_consumption.txt",na.strings="?",nrows=75000)
dt<-mutate(dt,Date=dmy(Date))
dt<-mutate(dt,Datetm=Date+hms(Time))

dt2<-filter(dt,Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))

rm(dt)

png(file="plot3.png")
##Plot 3
plot(y=dt2$Sub_metering_1,x=dt2$Datetm,xlab="",ylab="Global Active Power",type="n")
points(y = dt2$Sub_metering_1,x=dt2$Datetm,col='darkgray',type='l',pch=0)
points(y = dt2$Sub_metering_2,x=dt2$Datetm,col='red',type='l',pch=0)
points(y = dt2$Sub_metering_3,x=dt2$Datetm,col='blue',type='l',pch=0)
#legend(legend = "topright")
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("darkgray","red","blue"),lwd = c(2,2,2))
       
#dev.copy(png,file="plot3.png")
dev.off()
