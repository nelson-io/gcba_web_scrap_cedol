#libraries
library(tidyverse)
library(httr)
library(rvest)
library(rio)

#set url
url <- 'https://www.cedol.org.ar/indices-logisticos.html'

#save website
website <- GET(url)

#get tables
tbls <- html_nodes(content(website), "table")


#extract tables
tbl1<-html_table(tbls[[1]], fill = T)
tbl2<-html_table(tbls[[2]], fill = T)


#export tbl1

tbl1 %>% 
  export('cedol.xlsx')
