# 단순 선형회귀의 적용 (선형회귀 해석하기까지가 선형회귀!)
# Cars 데이터
str(cars) #속도와 제동거리(속도에 따른 제동거리-y가 dist, x가 speed / 키와 몸무게라면 키에 따른 몸무게)
plot(cars)
# x와 y를 정하고 물결을 해주기 /회귀식 긋기
car_model <- lm(dist~speed,data=cars)
coef(car_model)
# 회귀식 : dist = 3.9324 * speed - 17.5791
abline(car_model,col='red')

summary(car_model) #계산식, 잔차 등등 (Pr에서 *이 많을 경우는 좋은 것(변수를 줄일떄 어떤 변수가 좋은지 구분해줌))
par(mfrow=c(2,2))
plot(car_model)
# 회귀식을 구하고 난 잔차가 잘 출력됐다면 정규성과 선형성, 등분산성, 독립성을 보아야한다. 네 가지를 구하면 제대로 선형회귀모형을 만들었다고 할 수 있음
# 선형성 - 자기멋대로 막 되어 있음 / 대각선 방향의 점 - 정규성 / 중앙으로 몰려있다면 좋음(빨간선)
# 블럭 단위로 코멘트 작성 -> 블럭 설정 후 ctrl+shift+C

# 속도 21.5 제동거리는?
nx1 <- data.frame(speed=c(21.5)) #숫자값이 하나여도 데이터프레임을 만들어줘야함
predict(car_model,nx1)

# 고차식(polynomial) 적용
lm2 <- lm(dist~poly(speed,2),data=cars) 
plot(cars)
x <- seq(4,25, length.out=211) 
head(x)
y <- predict(lm2, data.frame(speed=x))
lines(x,y,col='purple',lwd=2)
abline(car_model,col='red',lwd=2)

summary(lm2) #1차식은 맞아떨어지지만 2차식은 아니다. 별 영향가 없음
# poly함수는 이차식이라고 계수가 하나가 아니라 일차항과 이차항의 계수로 두개가 주어진다.

# Cars 1차식부터 4차식까지
x <- seq(4,25, length.out=211)
colors <- c('red','purple','darkorange','blue')
plot(cars)
for (i in 1:4) {
    m <- lm(dist~poly(speed,i),data=cars)
    assign(paste('m',i,sep='.'),m)
    y <- predict(m,data.frame(speed=x))
    lines(x,y,col=colors[i],lwd=2)
}

#분산 분석(ANOVA)
anova(m.1,m.2,m.3,m.4) #summary에서 나오는거랑 비슷함 Pr를 보고 0.05보다 큰지 확인!

# Women data
women
plot(women)
m <- lm(weight~height,data = women)
abline(m,col='red',lwd=2)
summary(m)

# 2차식으로 모델링
m2 <- lm(weight ~ poly(height, 2), data=women)
x <- seq(58, 72, length.out=300)
y <- predict(m2, data.frame(height=x))
lines(x, y, col='blue', lwd=2)
summary(m2)
coef(m2)
