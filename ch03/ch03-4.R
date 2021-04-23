#dataframe
name = c('철수','춘향','길동')
age = c(22,20,25)
gender =factor(c('M','F','M'))
blood_type = factor(c('A','O','B'))

patients <-data.frame(name, age, gender, blood_type)
patients

patients$name
typeof(patients$name)
patients[1,] #첫 번쨰 행의 전부 다(빈칸이 all을 뜻함)
patients[,2] #두 번쨰 열이 모두 나옴(#patients$age과 동일)
patients[2,3]
patients$gender[3]
patients[patients$name == '철수',] #patients[1,], filtering
patients[patients$name == '철수',c('age','gender')] #selecting

#데이터프레임의 속성명을 변수명으로 사용 = attach~detach사이에서 사용가능
attach(patients) #patients를 생략하고 사용가능
name
detach(patients)

head(cars)
attach(cars)
speed
dist
detach(cars)
speed  #detach이후엔 speed라는 객체를 찾을 수 없음

mean(cars$speed)
max(cars$dist)
with(cars,mean(speed))

#subset 
subset(cars, speed>20)
cars[cars$speed>20,]
subset(cars, speed>20,select=c(dist))
subset(cars, speed>20,select=-c(dist)) #dist를 제외한 데이터만 추출

#NA처리
head(airquality)
str(airquality)
sum(airquality$Ozone) #중간에 결측치가 있으면 값도 결측치가 되므로 결측치 처리를 해줘야 함

head(na.omit(airquality))  #결측치가 제거된 상태에서 데이터를 보여줌(NA가 포함된 행 전체를 제거)

#여러 데이터 병합(merge)
patients
patients1 <- data.frame(name,age, gender)
patients2 <- data.frame(name, blood_type)
merge(patients1,patients2,by='name')

#데이터프레임에 행 추가
length(patients1$name)
patients1[length(patients1$name)+1,] <- c('몽룡',19,'M')
patients1
patients2[length(patients2$name)+1,] <- c('영희','A')
patients2


#열 추가
patients1['birth_year'] <- c(1500,1550,1600,1800)
patients1

#merge
#inner join
merge(patients1,patients2)
#left outer join
merge(patients1,patients2,all.x = T)
#right outer join
merge(patients1,patients2,all.y = T)
#(full) outer join
merge(patients1,patients2,all.x = T,all.y = T)
