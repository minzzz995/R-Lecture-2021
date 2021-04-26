# dplyr라이브러리를 이용한 데이터 가공
# filter(행 거름), select(열 거름), group_arrange(순서대로), by$summarize, mutate(새로운 columns을 만들고싶을때)
library(dplyr)
library(gapminder)

#1. select - 원하는 열 추출
select(gapminder, country, year,lifeExp)
select(gapminder, country, year,lifeExp) %>% head()
select(gapminder, country, year,lifeExp) %>% head(10)

#2. filter - 원하는 행 추출
filter(gapminder, country=='Croatia')
filter(gapminder, country=='Croatia'& year>2000)
filter(gapminder, continent=='Europe'&year==2007 )

#3. arrange
europe_pop <- filter(gapminder,continent=='Europe'&year==2007)
arrange(europe_pop,lifeExp)
arrange(europe_pop,desc(lifeExp))

#아프리카대륙에서 평균수명이 가장 긴 Top5 국가
africa_pop <- filter(gapminder,continent=='Africa'&year==2007)
arrange(africa_pop,desc(lifeExp)) %>% head(5)

gapminder %>% 
    filter(gapminder,continent=='Africa'&year==2007) %>% 
    arrange(desc(lifeExp)) %>% 
    head(5)
