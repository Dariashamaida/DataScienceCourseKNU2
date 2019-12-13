
# reading data

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\dumen\\Documents\\exdata_data_NEI_data")

data1 <- readRDS('summarySCC_PM25.rds')
data2 <- readRDS('Source_Classification_Code.rds')

sumOfEmissionsByYear <- aggregate(x=data1[,'Emissions'],
                                  by=list(data1[,'year']),
                                  FUN = sum)
plot(sumOfEmissionsByYear, type='b', 
     xlab='Year', 
     ylab='Sum of emissions(tonns)')