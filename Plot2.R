Plot2<-function()
{
    # Create the PNG device
    png("plot2.png", width=480, height=480)
    
    # Plot a line graph of the Global Active Power by datetime
    with(power_data, plot(Global_active_power~Datetime, type="n", 
                          ylab="Global Active Power (kilowatts)"))
    with(power_data, lines(Datetime, Global_active_power))
    
    # Write the results to the file
    dev.off()
}