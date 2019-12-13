
# reading data

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\dumen\\Documents\\exdata_data_NEI_data")

data1 <- readRDS('summarySCC_PM25.rds')
data2 <- readRDS('Source_Classification_Code.rds')

join_ds <- merge(data1, data2, by.x ='SCC', by.y='SCC' )

join_ds2 <- subset(join_ds, grepl("(Comb)(.)+(Coal)", join_ds$Short.Name))

task4.data <- rename(aggregate(x=join_ds2[,'Emissions'], 
                               by=list(join_ds2[,'year']), 
                               FUN = sum), 
                     Year = Group.1,  Emissions.in.tonns=x)

plot(task4.data, type='b', 
     xlab='Year', main = 'Emissions from coal combustion-related sources in USA', 
     ylab='Sum of emissions(tonns)')
