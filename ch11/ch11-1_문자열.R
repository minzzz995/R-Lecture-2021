# 문자열 처리
# [R] R에서 String(문자열) 처리하기 - 베어베어스
library(stringr)

# 1. Character로 형 변환
example <- 1
typeof(example)  #결과는 double(숫자)
example <- as.character(example)
typeof(example) #결과는 character로 형 변환

# 입력을 받는 경우 / 기본적으로 문자열이 들어오니까 숫자로 바꿔줌
input <- readline('prompt> ')
input
i <- as.numeric(input)
3 * i # 문자와 숫자는 type이 다름 (둘 사이의 변환 잘해야 함)

# 2. string 이어붙이기
paste('A','quick','brown','fox') #기본적으로 단어들 사이에 space가 붙음
paste0('A','quick','brown','fox') # 단어사이에 공백이 없어짐(중간에 sep없음)
paste('A','quick','brown','fox',sep = '-') # 공백대신 -기호 붙음
s <- paste('A','quick','brown','fox',sep = '-') 
#l <- str_split(s, '-') #list가 됨
#l
#l[1] #vector가 됨
#paste(l) #list로 묶은 것을 하나로 만드려고 하면 \는 벡터형태를 말함
#paste(l, collapse = '')
sample <- c('A','quick','brown','fox') #vector로 만듦
paste(sample) #paste로 하면 하나로 연결시키지 못함
paste(sample, collapse = '')
str_c(sample, sep = '_') #str_c는 stringr의 함수
str_c(sample, 1, sep = '_')
str_c(sample, 1, sep = '_', collapse = '@@' )

# 3. Character 개수 카운트
x <- 'Hello'
nchar(x) # 글자 숫자 세어줌(5바이트)
h <- '안녕하세요'
nchar(h) # 한글도 세어줌(15바이트)
str_length(h)

# 4. 소문자 변환
tolower(x)

# 5.대문자 변환
toupper(x)

# 6. 2개의 Character vector를 중복디는 항목 없이 합하기
str_1 <- c("hello", "world", "r", "program")
str_2 <- c("hi", "world", "r", "coding")
union(str_1, str_2) #합집합

# 7. 2개의 chatacter vector에서 공통된 항목 추출
intersect(str_1,str_2) #교집합

# 8. 2개의 chatacter vector에서 공통되지 않는 항목 추출 = 차집합
setdiff(str_1,str_2)

# 9. 2개의 character vector 동일여부확인(순서에 관계없이)
str_3 <- c("r", "hello", "world", "program")
setequal(str_1, str_2)
setequal(str_1, str_3)

# 10. 공백 없애기
vector_1 <- c("   Hello World!  ", "    Hi R!    ")
str_trim(vector_1, side = 'left') #글자 사이의 공백은 말고 글자 앞에 있는 공백을 없애줌 / str_trim은 stringr에만 있는 함수 
str_trim(vector_1, side = 'right')
str_trim(vector_1, side = 'both')

# 11. string 반복
str_dup(x,3) #x를 3회 반복
rep(x,3) #글자 전체가 뗴어지는 하나의 벡터를 만들때

# 12. Substring(String의 일정 부분) 추출 
string_1 <- "Hello World"
substr(string_1,7,9)
substring(string_1,7,9)
str_sub(string_1,7,9)
substr(string_1,7) #substr은 error가 남(종료값 지정 필수)
substring(string_1,7) #시작값에서부터 끝까지 보여줌(error안남)
str_sub(string_1,7) #시작값에서부터 끝까지 보여줌(error안남)
str_sub(string_1,7,-1) #-1이 World의 d
str_sub(string_1,7,-3) #-3은 뒤에서 3번째
string_1[7:9] #python에선 가능, R에서는 error

# 13. String의 특정 위치에 있는 값 바꾸기  
string_1 <- "Today is Monday"
substr(string_1, 10,12) <- "Sun"
string_1
substr(string_1,10,12) <- "Thurs"
string_1 # Today is Thuday(3글자만 인식해 rs는 없어짐)

# 14. 특정 패턴(문자열)을 기준으로 String 자르기
strsplit(string_1,split = " ")
strsplit(string_1,pattern = " ")
strsplit(string_1, pattern = " ",n=2)
strsplit(string_1, pattern = " ",simplify = T) #matrix형태로 출력
x <- strsplit(string_1,pattern = " ") # split를 하면 결과가 list로 나옴
typeof(s) #type이 list가 됨
s[[1]]
s[[1]][1] #1번째 list의 1번째 element
#list를 vector로 변환(unlist)
unlist(s)
paste(unlist(s),collapse = ' ')

# 15. 특정 패턴(문자열) 찾기 (기본 function)
vector_1 <- c("Xman", "Superman", "Joker")
grep('man',vector_1) #첫번째와 두번째에 man이 있어서 1,2 출력
grepl('man',vector_1) # true, false로 나타냄
regexpr("man",vector_1) #2,6,-1(첫번째는 2번째, 마지막은 없어서 -1)
gregexpr("man",vector_1)

# 16. 특정 패턴(문자열) 찾기 (stringr package function) 
fruit <- c("apple", "banana", "cherry")
str_count(fruit,'a') #a가 몇번 나왔는지
str_detect(fruit,'a') # true, false로 나타냄
str_locate(fruit,'a') 
str_locate_all(fruit,'a')
people <- c("rorori", "emilia", "youna")
str_match(people, "o(\\D)")  # \\D는 non-digit character를 의미함(숫자가 아닌 캐릭터를 의미할때)

# 17. 특정 패턴(문자열) 찾아서 다른 패턴(문자열)으로 바꾸기
fruits <- c("one apple", "two pears", "three bananas")
sub('a','A',fruits)
gsub('a','A',fruits)
str_replace(fruits,'a','A')
str_replace_all(fruits,'a','A')
