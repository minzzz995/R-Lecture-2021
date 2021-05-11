# Converting JSON to R DataFrame
library(jsonlite)
library(httr)

df_repos <- fromJSON("http://api.github.com/users/hadley/repos")
str(df_repos)
names(df_repos)

names(df_repos$owner)