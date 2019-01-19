library(rvest)

link <- "http://www.elblogdeldecorador.cl/category/proyectos/page/3/"

blogRodrigo <- read_html(link)

links <- html_nodes(blogRodrigo,".custom")

links <- html_attr(links,"href")


for(link in links){
  print(link)
  link <- link
  
  blogRodrigo <- read_html(link)
}
