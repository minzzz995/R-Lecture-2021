#데이터 정제
score <- read.csv('data/students2.csv')
score

#for(i in 2:4) {
#    score[, i] <- ifelse(score[,i] > 100 |score[,i] < 0, NA, score[,i])
#} 
#score
#3항 연산자 사용용
score[,2:4] <- ifelse(score[,2:4]<0 | score[,2:4]>100,
                      NA,score[,2:4])

score

