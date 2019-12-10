# ����������� ������ � 1. ������������ �� ���������� �����.

## 1. �� ��������� download.file() ���������� ����� excel ���� � ������� http://data.gov.ua �� �������� ���� (xls, xlsx � ����� �������, ���� ���������� mode = �wb�. ������� ����� 6 ����� ���������� ������ �����.

install.packages("xlsx") 
library(xlsx) 

install.packages("readxl") 
library(readxl)

install.packages("XML") 
library(XML)

events_web<-"https://data.gov.ua/dataset/c164ab46-25e1-4590-b63d-6e3c0fc6a52c/resource/d09ec7be-ba95-43ca-9c3a-37d0afafa31c/download/events_of_science.xlsx"
events<-"C:/Users/dumen/Documents/events_of_science.xlsx"
download.file (events_web, events, mode = "wb")

table_events<-read_xlsx(events)
head(table_events, n=6)

## 2. �� ��������� download.file() ���������� ���� getdata_data_ss06hid.csv �� ���������� https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv �� ���������� ��� � R. Code book, �� ������� �������� ������ ����������� �� ���������� https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0 ��������� ������, ������ property ����� value $1000000+

housing_web<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
housing<-"C:/Users/dumen/Documents/housing.csv"
download.file (housing_web, housing)
table_housing<-read.csv(housing)

length(which(table_housing$VAL==24))

## 3.	�������� xml ���� �� ���������� http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml ������ ��������� ����� zipcode 21231?

rest_web<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
rest<-xmlTreeParse(rest_web, useInternal = TRUE)
root_rest<-xmlRoot(rest)
zipcode<-xpathSApply(root_rest, "//zipcode", xmlValue)

length(which(zipcode==21231))