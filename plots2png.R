## Save plots to png

## Images where saved to the directory called "img"
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists('./Data')){
    dir.create('./Data')
}

if(!file.exists('./Data/edata.zip')){
    osname <- Sys.info()[1]
    if(osname == "windows"){
        download.file(url = dataURL, 
                      './Data/edata.zip')
    }else{
        download.file(url = dataURL, 
                      './Data/edata.zip',
                      method="curl")
    }
}
if(!file.exists('./Data/household_power_consumption.txt')){
    unzip(zipfile = "Data/edata.zip",files ="household_power_consumption.txt", exdir="./Data")
}

source('./read.power.R')
source('./plot1.R')
source('./plot2.R')
source('./plot3.R')
source('./plot4.R')
plots2png <- function(srcfile='./Data/household_power_consumption.txt',
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

plots2png()