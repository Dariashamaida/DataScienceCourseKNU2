# Лабораторна робота № 4. Зчитування даних з реляційних баз даних.

```{R}
install.packages("RSQLite")
library(RSQLite)

install.packages("DBI")
library(DBI)

conn <- dbConnect(RSQLite::SQLite(), "C:/Users/dumen/Documents/database.sqlite")
res <- dbSendQuery(conn, "SELECT Name as Author 
                          FROM Authors 
                          ORDER BY Name")
df <- dbFetch(res, n=10)
dbClearResult(res)
dbDisconnect(conn)
df
```

## 1.	Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки статті с типом виступу Spotlight. Сортування по назві статті.

```{R}
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/dumen/Documents/database.sqlite")
query <- dbSendQuery(conn, "SELECT Title, EventType 
                              FROM Papers 
                              WHERE EventType = 'Spotlight' 
                              ORDER BY Title")
Spotlight <- dbFetch(query, n=10)
dbClearResult(query)
dbDisconnect(conn)
Spotlight
```
## 2.	Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.

```{R}
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/dumen/Documents/database.sqlite")
query <- dbSendQuery(conn, "SELECT Name, Title
                              FROM Authors ath
                              INNER JOIN PaperAuthors pa ON ath.Id = pa.AuthorID 
                              INNER JOIN Papers pprs ON pa.PaperId = pprs.Id
                              WHERE Name = 'Josh Tenenbaum'
                              ORDER BY Title")
Josh <- dbFetch(query, n=10)
dbClearResult(query)
dbDisconnect(conn)
Josh
```

## 3.	Вибрати всі назви статей (Title), в яких є слово «statistical». Сортування по назві статті.

```{R}
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/dumen/Documents/database.sqlite")
query <- dbSendQuery(conn, "SELECT Title 
                              FROM Papers
                              WHERE Title LIKE '%statistical%'
                              ORDER BY Title")
stat <- dbFetch(query, n=10)
dbClearResult(query)
dbDisconnect(conn)
stat
```

## 4.	Ім’я автору (Name), кількість статей по кожному автору (NumPapers). Сортування по кількості статей від більшої кількості до меньшої.

```{R}
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/dumen/Documents/database.sqlite")
query <- dbSendQuery(conn, "SELECT Name, COUNT (Title) AS NumPapers
                              FROM Authors ath
                              INNER JOIN PaperAuthors pa ON ath.Id = pa.AuthorID 
                              INNER JOIN Papers pprs ON pa.PaperId = pprs.Id
                              GROUP BY Name
                              ORDER BY NumPapers DESC")
NumPapers <- dbFetch(query, n=10)
dbClearResult(query)
dbDisconnect(conn)
NumPapers
```
