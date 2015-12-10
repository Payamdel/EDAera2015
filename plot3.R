######## Plot 3
#The dataset is already stored in my working directory and the data is loaded into R using the following codes where stringsAsFactors=FALSE is added to avoid the conversion of vectors to factors:
filenamne <- "household_power_consumption.txt"
rawfile <- read.table(filenamne, header= TRUE, sep= ";", stringsAsFactors= FALSE)

#Create a subset of the entire dataset including the dates 2007-02-01 and 2007-02-02 only.
Date <- rawfile[,1]
SubDate <- is.element(Date , strsplit(c("1/2/2007","2/2/2007")," "))
SubDate <- rawfile[SubDate,]

## read in date/time info in format "%d/%m/%Y %H:%M:%S"
dates <- SubDate$Date
times <- SubDate$Time
#Use the paste function to concatenate vectors after converting to character. The cbind function would not work here as it will generate matrix instead of character.
x <- paste(dates, times)

# Since i do live in Sweden and i want to express the dates in English instead of Swedish, i do use the following code first.
Sys.setlocale("LC_TIME", locale="USA")

# To convert the Date and Time variables to Date/Time classes in R using the strptime(), i.e., Date-time conversion from character vector.
Date_Time <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

#Making a plot
png(filename = "plot3.png", width= 400, height= 400) 
plot (Date_Time, as.numeric(SubDate$Sub_metering_1), type ="l", col ="black", xlab= " ",  ylab = "Energy Sub Metering" ) 
lines (Date_Time, as.numeric(SubDate$Sub_metering_2), col= "red")
lines (Date_Time, as.numeric(SubDate$Sub_metering_3), col= "blue")
legend ("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=1)
dev.off()
 
