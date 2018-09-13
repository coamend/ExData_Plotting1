Plot4<-function()
{
    # Create the PNG device
    png("plot4.png", width=480, height=480)
    
    # Setup 2x2 grid of plots
    par(mfrow=c(2,2))
    
    # Plot a line graph of the Global Active Power by datetime
    with(power_data, plot(Global_active_power~Datetime, type="n", 
                          ylab="Global Active Power (kilowatts)"))
    with(power_data, lines(Datetime, Global_active_power))
    
    # Plot a line graph of the Voltage by datetime
    with(power_data, plot(Voltage~Datetime, type="n"))
    with(power_data, lines(Datetime, Voltage))
    
    # Plot a line graph of the Energy Sub Metering by datetime
    with(power_data, plot(Sub_metering_1~Datetime, type="n", 
                          ylab="Energy Sub Metering (watt-hours)"))
    with(power_data, lines(Datetime, Sub_metering_1))
    with(power_data, lines(Datetime, Sub_metering_2, col="red"))
    with(power_data, lines(Datetime, Sub_metering_3, col="blue"))
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lwd=2, col=c("black", "red", "blue"), bty="n")
    
    # Plot a line graph of the Global Reactive Power by datetime
    with(power_data, plot(Global_reactive_power~Datetime, type="n", 
                          ylab="Global Reactive Power (kilowatts)"))
    with(power_data, lines(Datetime, Global_reactive_power))
    
    # Write the results to the file
    dev.off()
}