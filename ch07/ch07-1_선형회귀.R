# 현실 세계의 모델링
X = c(3,6,9,12.)
Y = c(3,4,5.5,6.5)
plot(X,Y)

# model 1 : y=0.5X+1.0
Y1 = 0.5*X + 1.0
Y1

# 평균 제곱 오차 : Mean Squared Error
(Y - Y1) **2
sum((Y - Y1) **2)
mse <- sum((Y - Y1) **2) / length(Y)
mse

#model 2 : Y=5/12X + 7/4
Y2 = 5 * X / 12 + 7/4
Y2
mse2 <- sum((Y - Y2)**2) / length(Y)
mse2
#mse2가 더 좋음

# R의 단순 선형 회귀모형 lm
model <- lm(Y ~ X) #물결주의
model

plot(X, Y)
abline(model, col='red')
fitted(model)
mse_model <- sum((Y - fitted(model))**2) / length(Y)
mse_model

#잔차 - Residuals - 예측값과 실제값의 차이
residuals(model)

#잔차제곱합 -> sum((Y - fitted(model))**2)
deviance(model)

#평균제곱오차(MSE)
deviance(model) / length(Y)

summary(model) #많은 양의 데이터를 보여줌(식,잔차 등등) t-value의 값이 나올 확률 : Pr(*(0.01)조금일치, **(0.01)완전일치)
# R-squared 0~1사이의 값인데 1에 가까울수록 모델이 현상을 잘 보여줌(모델이 쓸만함을 보여줌)
# 유의수준0.05 = 신뢰수준 95%

# 예측
newX <- data.frame(X=c(1.2,2.0,20.65))
newY <- predict(model,newdata = newX)
newY

# 237연습문제01
X = c(10.0,12.0,9.5,22.2,8.0) # X집합
Y = c(360.2,420.0,359.5,679.0,315.3) # Y집힙

model <- lm(Y ~ X) # lm함수로 모델링
plot(X, Y)  
abline(model, col='red') # lm함수로 찾은 최적모델
summary(model) # lm함수로 찾은 최적 모델의 오차분석
deviance(model) # 잔차제곱합
deviance(model) / length(Y) # 평균제곱오차(MSE)

newX <- data.frame(X=c(10.5,25.0,15.0)) #predict예측
newY <- predict(model,newdata = newX)
newY

plot(newX$X,newY,pch=2)
abline(model, col='red')
