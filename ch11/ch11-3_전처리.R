# Wikipedia "data science"
library(RCurl)
library(XML)
library(stringr)

html <- readLines('https://en.wikipedia.org/wiki/Data_science') #readLines:파일에서 읽음
html <- htmlParse(html, asText = T)
doc <- xpathApply(html, '//p',xmlValue) #데이터를 읽어들이는 방법 중에서 마이크 커서로 어느 부분을 찍을때 나타나는 것=xpath
length(doc)
doc[1] #내용이 없음
doc[2] #글자가 들어가 있음
doc[3]
corpus <- doc[2:3]

# 모두 소문자로 변경
corpus <- tolower(corpus)
corpus[1]

# 숫자제거
# 숫자를 나타내는 정규표현식 : '\\d','[[:digit:]]'
corpus <- gsub('\\d','',corpus) # 바꾸려고 하는 문자열이 나옴(숫자를 아무것도 아닌거로 바꾸려고 함)
corpus <- gsub('[[:digit:]]','',corpus)
corpus[1]

#구둣점 제거
corpus <- gsub('[[:punct:]]','',corpus)
corpus <- gsub("[\\\\!\"#$%&'()*+,./:;<=>?@[\\^\\]_`{|}~-]",'',corpus,perl = T) #perl=은 language인데 T인 옵션에 한해 동작이 수행됨
corpus[1]

# 끝에 있는 공백 제거
corpus <- gsub('\n',' ',corpus)
corpus <- str_trim(corpus,side = 'right')
corpus[1]

# 불용어 제거 (1. 단어들을 구분해주기, 2. 단어들 중에서 하나씩 끄집어내고 stopwords에 포함되어있는지 검사)
stopwords <- c('a','the','and','in','of','to','but')
gsub('a','',corpus)
words <- str_split(corpus,' ')
words #리스트이기 때문에 두개의 리스트가 나오고 하나의 벡터로 표현됨
unlist(words) #리스트가 사라지고 하나의 벡터가 됨

# 반복문 사용 (list사용 append가 쉬워서 뒤에 계속 매달 수 있음)
# string을 만들고 빈 리스트에 계속해서 매달아 sum과 같은 의미로 볼 수 있다.
l <- list() # 빈 리스트 생성
for (word in unlist(words)) {
    if (!word %in% stopwords){
        l <- append(l,word)
    }
}
corpus <- paste(l,collapse = ' ')
corpus 

# ! > `%notin%`( ` : tab 위의 기호)
`%notin%` <- Negate(`%in%`)
l <- list()
for (word in unlist(words)) {
    if (word %notin% stopwords){
        l <- append(l,word)
    }
}
corpus <- paste(l,collapse = ' ')
corpus 
 

