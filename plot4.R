## plot4.R
## author: sjchan-ds (gitHub username)
## 
## To plot four figures on a page: 
##   Global Active Power plot in [1,1] location
##   Voltage plot in [1, 2] location
##   Sub metering plot in [2,1] location
##   Global reactive power plot in [2,2] location
##
## input file: household_power_consumption.txt
## output file: plot4.png (480 pixel x 480 pixel)
##
## Requirement: the data file and plot4.R should be in the same working directory in R or Rstudio
#################################################################################################

###### READING DATA AND PREPARING DATA FOR PLOTTING ########
## read the data in the working directory
dfrm <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors =F, na.strings='?')

## subset the data frame dfrm: only the date "1/2/2007" and "2/2/2007" to be selected
##### (see cleaningdata notes: 03_02_summaryingData.pdf regrading to the usage of %in%
sub_dfrm <- dfrm[dfrm$Date %in% c("1/2/2007","2/2/2007"),] 

## define a new local time series variable
datetime_cc <- paste(sub_dfrm$Date, sub_dfrm$Time)

## Convert into the POSIXlt type from character type
datetime <- strptime(datetime_cc, "%d/%m/%Y %H:%M:%S")

###### PLOTTING STAGE ###################################
## make test plots on screen before saving/making the four plots into a PNG file
##   par(bg="transparent")
# Configure multiplot
##   par(mfrow=c(2,2))
## Global Active Power plot in [1,1] location
##  plot(datetime, sub_dfrm$Global_active_power, type="l", ylab="Global Active Power", xlab="")
## Voltage plot in [1, 2] location
##   plot(datetime, sub_dfrm$Voltage, type="l", ylab="Voltage", xlab="datetime")
## Sub metering plot in [2,1] location
##   plot(datetime, sub_dfrm$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
##   lines(datetime, sub_dfrm$Sub_metering_2, col="red")
##   lines(datetime, sub_dfrm$Sub_metering_3, col="blue")   
##   legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
##        lty = 1, col = c("black", "red", "blue"), lwd=1.5, bty="n")
## Global reactive power plot in [2,2] location
##  plot(datetime, sub_dfrm$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#################################################################

####Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixel
## Open the graphic device: PNG
###In the figure subdirectory, the background of the given template unnamed-chunk-4.png is transparency.

png(file = "plot4.png", width=480, height=480, units="px", bg="transparent") 

# Configure multiplot
par(mfrow=c(2,2))

## Global Active Power plot in [1,1] location
plot(datetime, sub_dfrm$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="", cex.lab=0.95)

## Voltage plot in [1,2] location
plot(datetime, sub_dfrm$Voltage, type="l", ylab="Voltage", xlab="datetime", cex.lab=0.95)

## Sub metering plot in [2,1] location
plot(datetime, sub_dfrm$Sub_metering_1, type="l", ylab="Energy sub metering", 
     xlab="", col="black", cex.lab=0.95)
lines(datetime, sub_dfrm$Sub_metering_2, col="red")
lines(datetime, sub_dfrm$Sub_metering_3, col="blue")   
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1, col = c("black", "red", "blue"), lwd=1.5, bty="n", cex=0.95)

## Global reactive power plot in [2,2] location
plot(datetime, sub_dfrm$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power", cex.lab=0.95)

## close the png file
dev.off()  


###### end of plot4.R ##################################