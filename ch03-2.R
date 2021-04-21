# 벡터(vector, 1차원 데이터)
s <- c(1,2,3,4,5,6)
s2 <- c(1:6)  #시작:끝
s3 <- c(6:1)
s4 <- 1:5
c(1:3,c(4:6))
c(1:30)
seq(1,100, by=2) #from, to, increment
seq(from=100, to=1, by = -3)
seq(0,1,by = 0.1)
seq(0,1,length.out=11)

rep(c(1:3),times=2) # 1 2 3 1 2 3
rep(c(1:3),each=2) #1 1 2 2 3 3 

#인덱싱
x <- seq(2,10,by=2)
x[1]
x[-1]  #첫번째 엘리먼트를 제외한 나머지
x[-3]

#slicing
x[1:3]
x[c(1,3,5)]
x[-c(2,4)]  #2번째, 4번째 엘레먼트를 배제

#C연산
x <- c(1:4)
y <- c(5:8)
z <- c(3,4)
w <- c(5:7)

x + 2
x + y
x + z
x + w 

length(w) #갯수구하기

x > 2
all(x>2) #AND
any(x>2) #true가 하나라도 있으면 true(OR)

#fancy indexing
y[x>2]

x <-1:10
head(x)
head(x,3)
tail(x)
tail(x,3)

#집합 연산
x <- 1:3
y <- 3:5
z <- c(3,1,2)

union(x,y)      #union(합집합:중복 허용되지 않음, 교환법칙 성립)
intersect(x,y)  #교집합
setdiff(x,y)   #차집합 (교환법칙 성립 안됨)
setequal(x,z)

#연습문제1
x <- c(1:5)
x <- c(1:5,(6:10))
x
t <- c(1:10)
