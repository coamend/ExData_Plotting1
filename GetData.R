GetData<-function()
{
    # Source the plotting functions
    source(path.expand("Plot1.R"))
    source(path.expand("Plot2.R"))
    source(path.expand("Plot3.R"))
    source(path.expand("Plot4.R"))
    
    # Download the zip of the dataset
    zipurl<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(zipurl, 'household_power_consumption.zip')
    
    # Assumes that the household_power_consumption.zip is in the 
    # current working directory
    unzip("household_power_consumption.zip", overwrite=TRUE)
    
    # Read in the power consumption data
    rawpower<<-read.table(path.expand("household_power_consumption.txt"),
                          sep=';',
                          # nrows = 10,
                          header = TRUE,
                          na.strings = "?"
                          )
    
    # Get the power consumption for February 1st & 2nd of 2007
    power_data<-subset(rawpower, 
                        Date == "1/2/2007" | Date == "2/2/2007")
                                          
    # Convert the Date and Time columns from char vectors to a Posix date
    power_data<-cbind(power_data, 
                        Datetime=as.POSIXct(
                        paste(power_data$Date, 
                              power_data$Time), 
                        format = "%d/%m/%Y %H:%M:%S"))
    
    # Convert the Date column from a char vector to a Date
    power_data$Date<-as.Date(power_data$Date, format = "%d/%m/%Y")
    
    # Get the abbreviated Weekday
    power_data<<-cbind(power_data, Weekday=weekdays(power_data$Date, TRUE))
    
    Plot1()
    Plot2()
    Plot3()
    Plot4()
}