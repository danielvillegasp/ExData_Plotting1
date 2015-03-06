## Generate plot 2

plot2 <- function(power.DF){
    # Descripcion:
    #   Plots the time series of the Global Active Power
    # Arguments
    #   power.DF Power consumption data.frame
    with(power.DF, plot(Time, 
                        Global_active_power, 
                        type='l',
                        ylab="Global Active Power (kilowatts)",
                        xlab=""))
}