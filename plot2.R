## plot2.R
## author: sjchan-ds (gitHub username)
## 
## To plot Global Active Power (kw) v.s. date
## input file: household_power_consumption.txt
## output file: plot2.png (480 pixel x 480 pixel)
##
## Requirement: the data file and plot2.R should be in the same working directory in R or Rstudio
#################################################################################################

###### READING DATA AND PREPARING DATA FOR PLOTTING ########
## read the data in the working directory
dfrm <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors =F, na.strings='?')

## subset the data frame dfrm: only the date "1/2/2007" and "2/2/2007" to be selected
##### (see cleaningdata notes: 03_02_summaryingData.pdf regrading to the usage of %in%
sub_dfrm <- dfrm[dfrm$Date %in% c("1/2/2007","2/2/2007"),] 

## define a new local time series variable timedate_cc 
datetime_cc <- paste(sub_dfrm$Date, sub_dfrm$Time)

## Convert into the POSIXlt type from character type
datetime <- strptime(datetime_cc, "%d/%m/%Y %H:%M:%S")

###### PLOTTING STAGE ###################################
## make test plots on screen before saving/plotting the plot into a PNG file
##par(bg="transparent")
##plot(datetime, sub_dfrm$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", 
##     xlab="", font.lab=1.5, font.axis=1.5)
################################################################
     
####Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixel
## Open the graphic device: PNG
###In the figure subdirectory, the background of the given template unnamed-chunk-3.png is transparency.

par(bg="transparent")
png(file = "plot2.png", width=480, height=480, units="px", bg="transparent") 
plot(datetime, sub_dfrm$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", 
     xlab="", font.lab=1.5, font.axis=1.5)  
dev.off()  ##close the png file

#### end of plot2.R ##############################
