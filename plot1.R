##Plot1.R
## author: sjchan-ds (gitHub username)
## 
## To plot a histogram of Global Active Power (kilowatts)
## input file: household_power_consumption.txt
## output file: plot1.png (489 pixel x 480 pixel)
##
## Requirement: the data file and plot1.R should be in the same working directory in R or Rstudio
#################################################################################################

###### READING DATA AND PREPARING DATA FOR PLOTTING ########
## read the data in the working directory
dfrm <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors =F, na.strings='?')

## subset the data frame dfrm: only the date "1/2/2007" and "2/2/2007" to be selected
##### (see cleaningdata notes: 03_02_summaryingData.pdf regrading to the usage of %in%
sub_dfrm <- dfrm[dfrm$Date %in% c("1/2/2007","2/2/2007"),] 

###### PLOTTING STAGE #######
## make test plots on screen before saving the plot into a PNG file
##par(bg="transparent")
##hist(sub_dfrm$Global_active_power, col="red", main = "Global Active Power",
##     xlab="Global Active Power (kilowatts)", font.lab=1.5, font.axis=1.5)
############################################################################

####Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Open the graphic device: PNG
## In the figure subdirectory, the background of the given template unnamed-chunk-2.png is transparency.

png(file = "plot1.png", width=480, height=480, units="px")
par(bg="transparent")
hist(sub_dfrm$Global_active_power, col="red", main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", font.lab=1.5, font.axis=1.5)
dev.off()  ##close the png file

############## end of plot1.R############################################################