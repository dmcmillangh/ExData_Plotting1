require(dplyr)
require(lubridate)
require(data.table)

dt<-fread("household_power_consumption.txt",na.strings="?",nrows=75000)
dt<-mutate(dt,Date=dmy(Date))
dt<-mutate(dt,Datetm=Date+hms(Time))

dt2<-filter(dt,Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))

rm(dt)
png(file="plot2.png")
##Plot 2
plot(y=dt2$Global_active_power,x=dt2$Datetm,xlab="",ylab="Global Active Power",type="l")
#dev.copy(png,file="plot2.png")
dev.off()

