
# reading data

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\dumen\\Documents\\exdata_data_NEI_data")

data1 <- readRDS('summarySCC_PM25.rds')
data2 <- readRDS('Source_Classification_Code.rds')


task6.data <- data1[which((data1$fips == '06037' | data1$fips == '24510') & 
                            data1$type == 'ON-ROAD'), ]


task6.agg <- rename(aggregate(x=task6.data[,'Emissions'], 
                              by=list(task6.data[,'fips'],task6.data[,'year']), 
                              FUN = sum), 
                    City=Group.1,Year = Group.2,  Emissions.in.tonns=x)

ggplot(task6.agg, aes(x=Year, y=Emissions.in.tonns, col=City)) + geom_line()