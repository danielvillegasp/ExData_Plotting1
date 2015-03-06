## This reads energy the power consumption dataset from a txt

read.power<-function(path, dates, sep=';'){
    # Description:
    #   This funcion reads the dataset of power consumption data.
    # Usage:
    #   read.power('/path/to/dataset.txt', dates_to_save)
    # Arguments:
    #   path is the path where the dataset is stored.
    #   dates_to_save is a vector of POSIXlt objects, only the dates in the vector
    #   are saved to the data.frame
    #   sep defines the separator used to separate rows in the data set.
    # Value:
    #   Returns a data.frame if the dates are found in the file, otherwise 
    #   it returns an empty list
    
    # open the connector to the file
    con <- file(path)
    header = strsplit(readLines(con, n=1), sep)[[1]]
    data<-lapply(readLines(con), function(line){
        # read the row as raw text and split it using the sep argument (default would be ;)
        row <- strsplit(line, sep)[[1]]
        # replace ? by NAs
        row[row=='?'] <- NA
        # check whether any of the dates are valid and if the dates correspond to the dates in the
        # args. I assumed the data was already cleaned
        if(any(dates==strptime(row[1], format="%d/%m/%Y"), na.rm=T)>0){
            row
        }else{
            NULL
        }
    })
    # remove any rows that are null
    data<-Filter(function(x) !is.null(x),data)
    # if there are items process data
    if(length(data)>0){
        # convert data from text to the data type they are supposed to be
        data<-as.data.frame(matrix(unlist(data), ncol=9, byrow = T))
        colnames(data)<-header
        data$Time <- strptime(mapply(paste, data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data$Global_active_power <- as.numeric(levels(data$Global_active_power)[data$Global_active_power])
        data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power)[data$Global_reactive_power])
        data$Voltage <- as.numeric(levels(data$Voltage)[data$Voltage])
        data$Global_intensity <- as.numeric(levels(data$Global_intensity)[data$Global_intensity])
        data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
        data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
        data$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3)[data$Sub_metering_3])
    }
    # close the file
    close(con)
    data
}
