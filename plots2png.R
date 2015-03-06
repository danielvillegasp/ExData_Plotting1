## Save plots to png
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
    png(file=paste(destfile, "/plot1.png", collapse="", sep=""), width=480, heigth=480, units="px")
    plot1(powerData)
    dev.off()
    png(file=paste(destfile, "/plot2.png", collapse="", sep=""), width=480, heigth=480, units="px")
    plot2(powerData)
    dev.off()
    png(file=paste(destfile, "/plot3.png", collapse="", sep=""), width=480, heigth=480, units="px")
    plot3(powerData)
    dev.off()
    png(file=paste(destfile, "/plot4.png", collapse="", sep=""), width=480, heigth=480, units="px")
    plot4(powerData)
    dev.off()
}