Plot3<-function()
{
    # Create the PNG device
    png("plot3.png", width=480, height=480)
    
    # Plot a line graph of the Energy Sub Metering by datetime
    with(power_data, plot(Sub_metering_1~Datetime, type="n", 
                          ylab="Energy Sub Metering (watt-hours)"))
    with(power_data, lines(Datetime, Sub_metering_1))
    with(power_data, lines(Datetime, Sub_metering_2, col="red"))
    with(power_data, lines(Datetime, Sub_metering_3, col="blue"))
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lwd=2, col=c("black", "red", "blue"))
    
    # Write the results to the file
    dev.off()
}