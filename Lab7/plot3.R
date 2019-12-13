
# reading data

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\dumen\\Documents\\exdata_data_NEI_data")

data1 <- readRDS('summarySCC_PM25.rds')
data2 <- readRDS('Source_Classification_Code.rds')

data.Baltimor <- subset(data1, fips == 24510)

task3.Baltimor <- aggregate(x=data.Baltimor[,'Emissions'], 
                            by=list(data.Baltimor[,'year'], data.Baltimor[,'type']), 
                            FUN = sum)
task3.Baltimor <- rename(task3.Baltimor, year=Group.1,type = Group.2,  Emissions.in.tonns=x)

ggplot(task3.Baltimor, aes(x=year, y=Emissions.in.tonns, col=type)) + geom_line()