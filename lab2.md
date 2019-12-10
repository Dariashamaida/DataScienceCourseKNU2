# Лабораторна робота № 2. Формат HDF5.

## 1.	Завантажте	файл	з	даними	за	посиланням https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1- 1187006834-4096.hdf5

```{R}
url_ligo<-"https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5"
dest_url_ligo<-"C:/Users/dumen/Documents/ZW170817_binary.hdf5"
download.file (url_ligo, dest_url_ligo, mode="wb")
```

## 2.	Встановить в R пакет для роботи з HDF5 файлами.
```{R}
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("rhdf5")

library(rhdf5)
```

## 3.	Виведіть зміст файлу командою h5ls().

```{R}
ZW170817 <- h5ls(dest_url_ligo)
ZW170817
```

## 4.	Зчитайте результати вимірів. Для цього зчитайте name Strain з групи strain в змінну strain.

```{R}
strain <- h5read(dest_url_ligo, name = "/strain/Strain")
strain
```

## 5. Також	з	«strain/Strain»	зчитайте	атрибут	(функція	h5readAttributes) Xspacing в змінну st та виведіть її. Це інтервал часу між вимірами.

```{R}
str_attrib <- h5readAttributes(dest_url_ligo, name='strain/Strain')
st <- str_attrib$Xspacing
st
```

## 6.	Знайдіть час початку події та її тривалість. Для цього з групи meta зчитайте в змінну gpsStart name GPSstart та в змінну duration name Duration.

```{R}
meta <- h5read(dest_url_ligo, name='meta')
gpsStart <- meta$GPSstart
gpsStart
duration <- meta$Duration
duration
```

## 7.	Знайдіть час закінчення події та збережіть його в змінну gpsEnd.

```{R}
gpsEnd<-gpsStart+duration
gpsEnd
```

## 8.	Створіть вектор з часу вимірів і збережіть у змінну myTime. Початок послідовності – gpsStart, кінець – gpsEnd, крок – st.

```{R}
myTime<-seq(gpsStart, gpsEnd, st)
myTime
```

## 9.	Побудуємо графік тільки для першого мільйону вимірів. Для цього створіть змінну numSamples, яка дорівнює 1000000.
```{R}
numSamples <- 1000000
numSamples
```

## 10.	Побудуйте графік за допомогою функції plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")
```{R}
plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")
```
