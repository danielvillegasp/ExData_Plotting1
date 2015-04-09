## Generates 4 plots for plot 4
source('./plot2.R')
source('./plot3.R')
plot4 <- function(power.DT){
    # Descripcion:
    #   Creates four different plots in a single chart...
    #   The function uses the files plot2.R and plot3.R to create two of the
    #   plots.
    # Arguments
    #   power.DF Power consumption data.frame
    par(mfrow=c(2, 2), mar=c(4,4,1,2), oma=c(1,1,1,1))
    plot2(power.DT)
    with(power.DT, plot(Time, Voltage, ylab="Voltage", type='l', xlab="datetime"))
    plot3(power.DT, box.lwd=0)
    with(power.DT, plot(Time, Global_reactive_power, xlab="datetime", ylab="Global reactive power", type='l'))
    par(mfrow=c(1,1))
}