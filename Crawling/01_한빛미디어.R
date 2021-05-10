library(rvest)
library(stringr)
library(dplyr)

# 웹 사이트 열기 (Rendering)
base_url <- 'https://www.hanbit.co.kr/media/books'
sub_url <- 'new_book_list.html'
url <- paste(base_url,sub_url,sep = '/')
url
html <- read_html(url)

container <- html %>% html_node('#container') #id='container' / css셀렉터
container
book_list <- html_node(container, '.new_book_list_wrap') #class=
book_list
sub_book_list <- html_node(book_list,'.sub_book_list_area')
sub_book_list
lis <- html_nodes(sub_book_list,'li') #<li> 모두 찾기
li <- lis[1]
info <- html_node(li,'.info')
info
title <- html_node(info,'.book_tit')
title
html_text(title)
title <- html_text(title)
writer <- info %>% 
    html_node('.book_writer') %>% 
    html_text()
writer

#title과 writer에 대한 list를 만들어야 함
title_vector <- c()
writer_vector <- c()
for (li in lis) {
    info <- html_node(li,'.info')
    title <- info %>% 
        html_node('.book_tit') %>% 
        html_text()
    writer <- info %>% 
        html_node('.book_writer') %>% 
        html_text()
    title_vector <- c(title_vector,title)
    writer_vector <- c(title_vector,writer)
}
new_books <- data.frame(
    title = title_vector,
    writer = writer
)
View(new_books)

##########################
# 도서 세부내용 크롤링
li <- lis[1]
href <- li %>% 
    html_node('.info') %>% 
    html_node('a') %>% 
    html_attr('href')
href
book_url <- paste(base_url,href,sep = '/')
book_url #space가 붙고 .이 붙음
book_html <- read_html(book_url)
book_html
info_list <- html_node(book_html, 'ul.info_list')
info_list
lis<- html_nodes(info_list,'li')

for (li in lis) {
    item <- li %>% 
        html_node('strong') %>% 
        html_text()
    if (substring(item,1,3) == '페이지') {
        page <- li %>% 
            html_node('span') %>% 
            html_text()
    len <- nchar(page)
    page <- as.integer(substring(page,1,len-2))
    break
    }
}
page
page_li <- lis[4]
page <- html_node(page_li,'span') %>% html_text()
page
len

pay_info <- html_node(book_html, '.payment_box.curr')
ps <- html_nodes(pay_info,'p')
price <- ps[2] %>% 
    html_node('.pbr') %>% 
    html_node('strong') %>% 
    html_text()
price <- as.integer(gsub(',','',price))
price

