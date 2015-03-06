## Generates Plot 3
plot3 <- function(power.DF){
    # Descripcion:
    #   Creates plot of three time series, Sub_metering_1, 
    #   Sub_metering_2 and Sub_metering_3 with a legend on the top-right corner.
    # Arguments
    #   power.DF Power consumption data.frame
    with(power.DF, plot(Time, Sub_metering_1, col="Black", type='l', 
                        ylab="Energy sub metering", xlab=""))
    with(power.DF, lines(Time, Sub_metering_2, col="Red"))
    with(power.DF, lines(Time, Sub_metering_3, col="Blue"))
    legend("topright", col=c("Black", "Red", "Blue"), 
                       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid")
}