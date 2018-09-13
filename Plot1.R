Plot1<-function()
{
    # Create the PNG device
    png("plot1.png", width=480, height=480)
    
    # Plot a histogram of the Global Active Power, with red bars
    with(power_data, hist(Global_active_power, 
                          col="red", 
                          main="Global Active Power",
                          xlab="Global Active Power (kilowatts)"))
    
    # Write the results to the file
    dev.off()
}