hpcdata<-read.table("household_power_consumption.txt",header=FALSE,na.strings="?",sep=";", colClasses = "character",skip=1)
dT<-strptime(hpcdata[,1],"%d/%m/%Y")
timeStart<-strptime("2007-02-01","%Y-%m-%d")
timeEnd<-strptime("2007-02-02","%Y-%m-%d")
mydata<-subset(hpcdata,dT==timeStart|dT==timeEnd)
xaxis<-as.POSIXct(paste(mydata[,1],mydata[,2]),format="%d/%m/%Y%H:%M:%S")
submeter1<-as.numeric(mydata[,7])
submeter2<-as.numeric(mydata[,8])
submeter3<-as.numeric(mydata[,9])
gap<-as.numeric(mydata[,3])
grp<-as.numeric(mydata[,4])
Voltage<-as.numeric(mydata[,5])
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(xaxis,gap,type="l",xlab="",ylab="Global Active Power")

plot(xaxis,Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(xaxis,submeter1,type="l",xlab="",ylab="Energy sub metering")
lines(xaxis,submeter2,col="red")
lines(xaxis,submeter3,col="blue")
legend("topright",lwd=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(xaxis,grp,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

