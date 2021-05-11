# JSON 기본 (내장 데이터 처리)

library(jsonlite)

pi
json_pi <- toJSON(pi, digits = 3)# toJSON : JSON 객체를 만든다(실수형태로 JSON형태로 만들기 가능)
json_pi
fromJSON(json_pi)

city <- '대전' #문자열도 가능
json_city <- toJSON(city)
json_city
fromJSON(json_city)

subject <- c('국어','영어','수학') # array 형태
json_subject <- toJSON(subject)
json_subject
fromJSON(json_subject)

# 데이터 프레임
# [
#   {
#     "Name": "Test",
#     "Age": 25,
#     "Sex": "F",
#     "Address": "Seoul",
#     "Hobby": "Basketball"
#   }
# ]

name <- c("Test")
age <- c(25)
sex <- c("f")
address <- c("Seoul")
hobby <- c("Basketball")
person <- data.frame(Name=name, Age=age, Sex=sex,
                     Address=address, Hobby=hobby)
str(person)

json_person <- toJSON(person)
json_person
prettify(json_person)

##########################################
df_json_person <- fromJSON(json_person)
str(df_json_person)

# 두개의 데이터 프레임의 데이터 값이 같은지 비교
all(person == df_json_person)

# cars 내장 데이터로 테스트
cars
json_cars <- toJSON(cars)
# json으로 바꾸고 난 후 prettify만들기
prettify(json_cars)
df_json_cars <- fromJSON(json_cars)
all(cars == df_json_cars)




