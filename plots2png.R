## Save plots to png

## Images where saved to the directory called "img"
source('./read.power.R')
source('./plot1.R')
source('./plot2.R')
source('./plot3.R')
source('./plot4.R')
plots2png <- function(srcfile='./RData/household_power_consumption.txt',
                      destfile='./img'){
    # Description: Creates the file where the images are going to be saved. Then it sets
    #              the device to png for each plot and saves each one.
    powerData <- read.power(srcfile, strptime(c('2007-02-01',
                                                '2007-02-02'),
                                              format="%Y-%m-%d"))
        
    if(!file.exists(destfile)){
        dir.create(destfile)
    }
    png(file=paste(destfile, "/plot1.png", collapse="", sep=""), width=480, height=480, units="px", bg="transparent")
    plot1(powerData)
    dev.off()
    png(file=paste(destfile, "/plot2.png", collapse="", sep=""), width=480, height=480, units="px", bg="transparent")
    plot2(powerData)
    dev.off()
    png(file=paste(destfile, "/plot3.png", collapse="", sep=""), width=480, height=480, units="px", bg="transparent")
    plot3(powerData)
    dev.off()
    png(file=paste(destfile, "/plot4.png", collapse="", sep=""), width=480, height=480, units="px", bg="transparent")
    plot4(powerData)
    dev.off()
}