# 영희의 물리 실험
library(scatterplot3d)

x <- c(3,6,3,6.)
u <- c(10,10,20,20.)
y <- c(4.65,5.9,6.7,8.02)
scatterplot3d(x,u,y,
              xlim = 2:7,ylim = 7:23,zlim = 0:10,
              pch=20,type = 'h')  #변수명은 레이블로 들어감

model <- lm(y~x+u) #독립변수로 x와 u를 쓰겠다 y = f(x,u)
coef(model) #y = 0.428 * x + 0.209 * u + 1.26
s <- scatterplot3d(x,u,y,
                   xlim = 2:7,ylim = 7:23,zlim = 0:10,
                   pch=20, type='h')
s$plane3d(model)

# 잔차
fitted(model) #y값
y
residuals(model)  # y - fitted(model)

#평균제곱오차(mse)
mse = deviance(model) / length(y)
mse

#새로운 데이터에 대한 예측
nx <- c(7.5,5)
nu <- c(15,12.)
new_data <- data.frame(x=nx,u=nu)
ny <- predict(model,new_data)
ny

s <- scatterplot3d(nx,nu,ny,
                   xlim = 0:10,ylim = 7:23,zlim = 0:10,
                   pch=20, type='h',color = 'red',angle=60)
s$plane3d(model)

summary(model)

#trees 데이터
head(trees)
dim(trees)
summary(trees) #gitrh, height가 독립변수, volume가 종속변수
scatterplot3d(trees$Girth, trees$Height, trees$Volume)

#모델링
tm <- lm(Volume ~ Girth + Height, data=trees)
tm
summary(tm)

#예측
ndata <- data.frame(Girth=c(8.5,13,19),Height=c(72,86,85.))
predict(tm, ndata)

#다중회귀분석
state.x77
head(state.x77)
states <- as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,data=states)
summary(fit)
par(mfrow=c(2,2))
plot(fit)
par(mfrow=c(1,1))

# 다중공선성 : 독립변수 간 강한 상관관계가 나타나는 문제
# Correlation (0.9이상이면 다중공선성 의심)
states.cor <- cor(states[2:5])
states.cor

# VIF(Variaton Inflation Factor) 계산(10 이상이면 다중공선성 의심)
library(car)
vif(fit)

#Condition Number (15이상이면 다중공선성의 가능성이 있음)
eigen.val <- eigen(states.cor)$values
sqrt(max(eigen.val) / eigen.val)

fit1 <- lm(Murder ~ ., data=states)
summary(fit1)

fit2 <- lm(Murder ~ Population+Illiteracy, data=states)
summary(fit2)

# AIC(Akaike Information Criterion)
AIC(fit1, fit2) # 값이 적을수록 좋은 모델

# Backward stepwise regression, Forward stepwise regression
step(fit1, direction = 'backward')

fit3 <- lm(Murder ~ 1, data=states)
step(fit3, direction = 'forward', 
     scope=~ Population+Illiteracy+Income+Frost)
step(fit3, direction = 'forward', scope=list(upper=fit1,lower=fit3))

library(leaps)
subsets <- regsubsets(Murder~., data=states, 
                      method='seqrep', nbest=4)
subsets <- regsubsets(Murder~., data=states, 
                      method='exhaustive', nbest=4)
summary(subsets)
plot(subsets)