# 분류(Classification)
# 결정트리(Decision Tree)
library(rpart)

head(iris)
dtc <- rpart(Species~.,data = iris,) #iris데이터를 결정트리로 학습
summary(dtc)
dtc

#결정트리 시각화
par(mfrow=c(1,1),xpd=NA)
plot(dtc) #가지치기 그림 나옴
text(dtc, use.n=T) # 설명이 나옴(use.n -> 이름 속성도 반환)

#예측
pred <- predict(dtc, iris, type = 'class') #type으로 예측 결과의 유형을 지정하는데 class는 각 분류에 속할 클래스를 예측하고자 한다고 할 수 있다.
table(pred,iris$Species)

#평가
library(caret)
confusionMatrix(pred, iris$Species)

#시각화 
library(rpart.plot)
rpart.plot(dtc)
rpart.plot(dtc,type=4) #type으로 노드에 레이블을 붙일 수 있음

# 훈련 / 테스트 셋으로 분리하여 시행
set.seed(2021)
#sample(1:10,4) seed랑 sample같이 수행해야 같은 결과 나옴
iris_index <- sample(1:nrow(iris),0.8*nrow(iris))
iris_train <- iris[iris_index,]
iris_test <- iris[setdiff(1:nrow(iris),iris_index),] #열을 다 뽑아야 하기 때문에 마지막에 , 해주기
dim(iris_train)
dim(iris_test) 
iris_test <- iris[-iris_index,] #위의 dim과 같은 결과 출력
dim(iris_test) 
table(iris_train$Species)

#모델링
dtc <- rpart(Species~.,iris_train) #모델링이 끝나고 학습까지 완료된 상태

#예측
pred <- predict(dtc,iris_test,type='class')

#평가
confusionMatrix(pred,iris_test$Species) #결과 :  Accuracy가 0.9라는 것을 알 수 있음

#비율대로 훈련 / 테스트 데이터 셋 만들기
train_index <- createDataPartition(iris$Species, p=0.8,list = F) #list형태냐 matrix형태로 만드냐 물어본 후 matrix형태로 만들어야 출력가능
iris_train <- iris[train_index,]
iris_test <- iris[-train_index,]
table(iris_train$Species)
table(iris_test$Species)

#학습
dtc <- rpart(Species~.,iris_train) # 다른 모델명만 rpart자리에 넣으면 분석순서는 똑같다

#예측
pred <- predict(dtc, iris_test, type='class')

# 평가
confusionMatrix(pred,iris_test$Species)

#시각화
rpart.plot(dtc)