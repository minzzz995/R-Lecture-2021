getwd()

#변수(variable)
x <- 1
y <- 2
z <- x + y
z

#swapping
temp <- x
x <- y
y <- temp

#변수의 타입
typeof(x)
a <- 'string'
typeof(a)
b <- 'double quote'
typeof(b)
c <- '한글글'
typeof(c)

#실수(numeric)
x <- 5
y <- 2
x / y

#복소수(complex)
xi <- 1 + 2i
yi <- 1 - 2i
xi + yi
xi - yi
xi * yi

#범주형(category)
blood_type = factor(c('A','B','O','AB'))
blood_type

#논리형(boolean)
TRUE
FALSE
T
F
xinf = Inf
yinf = -Inf
xinf / yinf

#데이터형 확인 함수
class(x) # R 객체지향관점
typeof(x) # R 언어자제관점
is.integer(x)
is.complex(xi)
is.character(c)
is.na(xinf/yinf)

#데이터형 변환함수
is.integer(as.integer(x))
is.factor(as.factor(c))

#산술연산자
5^2
4 ^ 1/2
x %% y       #나머지(module)
x %/% y      #몫몫

#비교연산자
x < y
x <= y
'***'
x>= y
x == y
x != y

#논리 연산자
IT
!T    #느낌표 T
!F    #느낌표 F
x | y  #OR
x & y  #AND
x || y
a <-c(F,F,T,T)
b <-c(F,T,F,T)
a | b       #element-wise OR
a || b      #첫 번쨰 엘리먼트의 논리 합
a & b
a && b
2 ^ (-3) -5 ** (1/2) > 2
