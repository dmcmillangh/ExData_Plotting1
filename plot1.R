require(dplyr)
require(lubridate)
require(data.table)

dt<-fread("household_power_consumption.txt",na.strings="?",nrows=75000)
dt<-mutate(dt,Date=dmy(Date))
dt<-mutate(dt,Datetm=Date+hms(Time))

dt2<-filter(dt,Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))

rm(dt)
png(file="plot1.png")
## plot 1
hist(dt2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#dev.copy(png,file="plot1.png")
dev.off()

