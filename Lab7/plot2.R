
# reading data

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\dumen\\Documents\\exdata_data_NEI_data")

data1 <- readRDS('summarySCC_PM25.rds')
data2 <- readRDS('Source_Classification_Code.rds')

data.Baltimor <- subset(data1, fips == 24510)
sumOfEmissionsByYear.Baltimor <- aggregate(x=data.Baltimor[,'Emissions'], 
                                           by=list(data.Baltimor[,'year']), 
                                           FUN = sum)
plot(sumOfEmissionsByYear.Baltimor, type='b', 
     xlab='Year', main = 'Emissions in Baltimor',
     ylab='Sum of emissions(tonns) in Baltimor')
