# koNLP 사용법
library(KoNLP)
useSejongDic() #이 것 말고도 systemDic, NIADic도 있음

s <- '너에게 묻는다. 연탄재 함부로 발로 차지마라. 너는 누구에게 한번이라도 뜨거운 사람이었느냐?'
extractNoun(s) # 명사를 추출해라

# 형태소 분석
SimplePos09(s)
SimplePos22(s) #22개의 품사로 더 자세히 분석, 사람/NC를 품사부착(POS Tagging)이라고 한다
nouns <- extractNoun(s)
typeof(nouns)
nouns #vector로 1에서부터 9까지 있는 데이터

ss <- '너에게 묻는다.\n연탄재 함부로 발로 차지마라.\n너는 누구에게 한번이라도 뜨거운 사람이었느냐?'
extractNoun(ss)

sss <- c('너에게 묻는다.','연탄재 함부로 발로 차지마라.','너는 누구에게 한번이라도 뜨거운 사람이었느냐?')
nouns <- extractNoun(sss) # list가 됨
nouns <- unlist(sss)
nouns
