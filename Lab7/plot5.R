
# reading data

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\dumen\\Documents\\exdata_data_NEI_data")

data1 <- readRDS('summarySCC_PM25.rds')
data2 <- readRDS('Source_Classification_Code.rds')


task5.data <- data1[ which(data1$fips == '24510' & data1$type == 'ON-ROAD'), ]

task5.agg <- rename(aggregate(x=task5.data[,'Emissions'], 
                              by=list(task5.data[,'year']), 
                              FUN = sum), 
                    Year = Group.1,  Emissions.in.tonns=x)

plot(task5.agg, type='b', 
     xlab='Year', main = 'On-road emissions in Baltimor', 
     ylab='Sum of emissions(tonns)')