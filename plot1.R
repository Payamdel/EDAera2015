#The dataset is already stored in my working directory and the data is loaded into R using the following codes where stringsAsFactors=FALSE is added to avoid the conversion of vectors to factors:
filenamne <- "household_power_consumption.txt"
rawfile <- read.table(filenamne, header= TRUE, sep= ";", stringsAsFactors= FALSE)

#Create a subset of the entire dataset including the dates 2007-02-01 and 2007-02-02 only.
Date <- rawfile[,1]
SubDate <- is.element(Date , strsplit(c("1/2/2007","2/2/2007")," "))
SubDate <- rawfile[SubDate,]

#Making a histplot for plot 1. 
png (filename = "plot1.png", width = 480, height= 480)
hist (as.numeric(SubDate$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
