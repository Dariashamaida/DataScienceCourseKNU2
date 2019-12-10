# Лабораторна робота № 3. Зчитування даних з WEB.

### В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100	фільмами	2017	року	виходу	за	посиланням «http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_ty pe=feature».	Необхідно створити data.frame «movies» з наступними даними: номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data). Для виконання лабораторної рекомендується використати бібліотеку «rvest». CSS селектори для зчитування необхідних даних: rank_data: «.text-primary», title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». Для зчитування url використовується функція read_html, для зчитування даних по CSS селектору – html_nodes і для перетворення зчитаних html даних в текст - html_text.  Рекомендується  перетворити  rank_data  та  runtime_data  з  тексту в числові	значення.	При	формуванні	дата	фрейму	функцією	data.frame рекомендується використати параметр «stringsAsFactors = FALSE».

```{R}
install.packages("rvest") 
library(rvest)

install.packages("stringr") 
library(stringr)

imdb<-read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")

rank <- html_nodes(imdb, '.text-primary')
rank_data<-as.integer (html_text(rank, trim = TRUE))

title <- html_nodes(imdb, '.lister-item-header a')
title_data <-  html_text(title, trim = TRUE)

runtime <- html_nodes(imdb, '.text-muted .runtime')
runtime_ <- str_remove(html_text(runtime, trim = TRUE), 'min')
runtime_data <- as.integer(runtime_)

Sys.setlocale(locale = "Ukrainian")
movies<-data.frame(rank_data, title_data, runtime_data, stringsAsFactors = FALSE)
movies
```
## 1.	Виведіть перші 6 назв фільмів дата фрейму.

```{R}
top6 <- head(movies$title_data, 6)
top6
```

## 2.	Виведіть всі назви фільмів с тривалістю більше 120 хв.
```{R}
longfilms <- subset(movies$title_data, runtime_data > 120)
longfilms
```

## 3.	Скільки фільмів мають тривалість менше 100 хв.
```{R}
shortfilms <- length(subset(movies$title_data, runtime_data < 100))
shortfilms 
```
