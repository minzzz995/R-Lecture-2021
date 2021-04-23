#함수 / 결과값만 return
#팩토리얼 함수(fact)
fact <- function(x) {
    prod <- 1
    for (i in 1:x) {
        prod <- prod * i
    }
    return(prod)
}
fact(5)
fact(10)

# 정수 a ~ b의 합을 구하는 함수(range_sum)
range_sum <- function(a,b) {
    sum <- 0
    for (i in a:b) {
        sum <- sum + i
    }
    return(sum)
}
range_sum(1,10)

#재귀함수
facto <- function(n) {
    if (n == 0) {
        return(1)
    }
   return(n*facto(n-1))
}
facto(10)

fibo <- function(n) {
    if (n==0 | n==1) {
        return(1)
    }
    return(fibo(n-1)+fibo(n-2))
}
for(i in 0:10) {
    print(paste(i,fibo(1)))
}

peak2peak <- function(x) {
    return(max(x)-min(x))
}
mat <- matrix(1:12,nrow = 3) #matrix만들기
apply(mat,1,mean)
mat
apply(mat,1,peak2peak) #10-1/11-2/12-3 apply를 사용해서 유용하게 사용 가능
apply(mat,2,peak2peak) #3-1/6-4/9-7

