# 전처리 하는 과정을 string말고 library를 이용해서 하기
library(RCurl)
library(XML)
library(stringr)

html <- readLines('https://en.wikipedia.org/wiki/Data_science')
html <- htmlParse(html, asText = T)
doc <- xpathApply(html, '//p',xmlValue)

library(tm)        # Text Mining 라이브러리
library(SnowballC) #어간 추출 라이브러리

doc <- Corpus(VectorSource(doc))
inspect(doc)

doc <- tm_map(doc, content_transformer(tolower)) #소문자 변환
doc <- tm_map(doc, removeNumbers) # 숫자 제거
doc <- tm_map(doc, removeWords, stopwords('english')) #불용어 제거
doc <- tm_map(doc, removePunctuation) # 구둣점 제거
doc <- tm_map(doc, stripWhitespace) # 앞뒤 공백 제거

#############################
# DTM구축
dtm <- DocumentTermMatrix(doc)
dim(dtm) #document가 13개, 단어가 363개가 나온다는 말
inspect(dtm) #total = 13 * 363 / 희소성(Sparsity) : 90% / inspect로 자료가 어떻게 생겼는지 조사
#inspect한 결과 data와 science, Statistics가 많이 나옴

#############################
# Word Cloud
library(wordcloud)

typeof(dtm)
m <- as.matrix(dtm) #dtm list를 matrix로 변환
v <- sort(colSums(m),decreasing = T) #단어 빈도 수가 많은 애가 순서가 위로 올라감
v[1:5] #data가 60회, science가 39회,,,
df <- data.frame(word=names(v),freq=v)
head(df)
#단어와 freq만 있으면 wordcloud를 만들 수 있음
wordcloud(words = df$word,freq = df$freq,min.freq = 1,
          max.words = 100, random.order = F, rot.per = 0.35)
#max.words = 100 -> 앞에서 데이터 많이 나온것 100개만 보여줘라 / random.order=F -> 많이 나온게 제일 크게 나와야하니까

library(wordcloud2)
wordcloud2(df) #wordcloud는 오리지날 쓰지말고 wordcloud2사용(wordcloud2옵션 공부하기!)

d200 <- df[1:200,] #200뒤에 ,(콤마) 주의
wordcloud2(d200, shape='star')
wordcloud2(d200, minRotation = pi/6,
           maxRotation = pi/3,rotateRatio = 1.0,
           backgroundColor = 'black')
#########################################################################################
#library(wordcloud2)
#library(htmlwidgets)
#library(tmltools)
#library(jsonlite)
#library(yaml)
#library(base64enc)

html <- readLines('C://workspace/R/data/Alice.txt')
html <- htmlParse(html, asText = T)
doc <- xpathApply(html, '//p',xmlValue)

doc <- Corpus(VectorSource(doc))
inspect(doc)

doc <- tm_map(doc, content_transformer(tolower)) #소문자 변환
doc <- tm_map(doc, removeNumbers) # 숫자 제거
doc <- tm_map(doc, removeWords, stopwords('english')) #불용어 제거
doc <- tm_map(doc, removePunctuation) # 구둣점 제거
doc <- tm_map(doc, stripWhitespace) 
dtm <- DocumentTermMatrix(doc)
dim(dtm) 
inspect(dtm)

typeof(dtm)
m <- as.matrix(dtm)
v <- sort(colSums(m),decreasing = T) 
v[1:5] 
df <- data.frame(word=names(v),freq=v)
head(df)

wordcloud2(df) 

d200 <- df[1:200,]
wordcloud2(d200, shape='star')
wordcloud2(d200, figPath = "C://workspace/R/data/Alice_mask.png", size = 1)
figPath <- system.file("C://workspace/R/data/Alice_mask.png",package = "wordcloud2")
wordcloud2(d200, figPath = figPath, size = 1.5,color = "black")







