## Generate plot 1

plot1 <- function(power.DF){
    # Descripcion:
    #   Shows the distribution of the Global Active Power variable
    #   in an histogram
    # Arguments
    #   power.DF Power consumption data.frame
    
    hist(power.DF$Global_active_power, 
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         col='Red')
}