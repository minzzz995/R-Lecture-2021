#파일 열기
getwd()
students <- read.table('data/students1.txt', header = T)
students
str(students)

#read.csv는 첫 행을 헤더로 읽는 것이 디폴트
students <- read.csv('data/students.csv') #여기서의 data가 파일이름으로 파일이름을 써줘야함
students

#파일 쓰기 (encoding 신경쓸 것)
write.table(students,file = 'data/output.txt',fileEncoding = 'utf-8')
