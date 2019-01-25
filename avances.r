###Iniciando la extracción de información Links ###

# Usando la librería rvest
library(rvest)

blogDD <- 'http://www.decorador.cl/categoria-producto/estar/'

webpageBDD <- read_html(blogDD)

#______________1.-  Extracción del texto contenido _____________________________
contenidoBDD <- html_nodes(webpageBDD,'.thumb-under > p > a')

# viendo el contenido de la posición 1
# de la variable contenidoWebXVideos
print(contenidoBDD[1])

# Extrayendo el texto de contenido
textoXBDD <- html_text(contenidoBDD)

# Viendo que tiene la posición 1 la variable texto
print(textoXBDD[1])

# Unificando los títulos
todosLosTitulos <- ""
for(i in 1 : length(textoXBDD)){
  todosLosTitulosBlogDD <- paste(todosLosTitulos," ",textoXBDD[[i]])
}
#Inspeccione la pagina y los textos estaban en lenguaje java ¨{hummmm (88)}

#### extraccion de texto decoracion ######

paginadecora<-'http://www.elblogdeldecorador.cl/2018/12/dormitorio-estilo-noretnic/'

webpagedecora<- read_html(paginadecora)

decora<- html_nodes(webpagedecora, ".container")

textodecora<- html_text(decora)

print(textodecora)

textodecora <- gsub("\r","",textodecora)
textodecora<- gsub("\n","",textodecora)
textodecora <- gsub("\t","",textodecora)
textodecora <- gsub("\"","",textodecora)
textodecora <- gsub("&acute;","á",textodecora)
textodecora <- gsub("&ecute;","é",textodecora)
textodecora <- gsub("&icute;","í",textodecora)
textodecora <- gsub("&ocute;","ó",textodecora)
textodecora <- gsub("&ucute;","ú",textodecora)
textodecora <- gsub(",","",textodecora)
textodecora <- gsub("[.]","",textodecora)

# Viendo la info en la variable textoNoticia
print(textodecora)

# Separando las palabras por espacio
splitEspacioDecora <- strsplit(textodecora," ")[[4]]

# Contando palabras
unlistDecoracion<-unlist(textodecora)
tablaPalabras<-table(unlisDecoracion)

# Pasando la información a un data frame
dfPalabrasDecora1 <- as.data.frame(textodecora)

# Pasando la información a un data frame
dfPalabrasDecora2 <- as.data.frame(splitEspacioDecora )

# Almacenando la información en CSV
write.csv(dfPalabrasDecora2, file="Palabrasdecora.csv")

# o en un txt
write.table(dfPalabrasDecora2, file="Palabrasdecora2.txt")




#_________2.- inicializando la variable archivo con el nombre de mi página__________________
link <- "http://www.elblogdeldecorador.cl/category/proyectos/page/3/"

# Leyendo el HTML del archivo
blogRodrigo <- read_html(link)

links <- html_nodes(blogRodrigo,".custom")

links <- html_attr(links,"href")


for(link in links){
  print(link)
  link <- link
  
  blogRodrigo <- read_html(link)
}

# inicializando la variable archivo con el nombre de mi página
link <- "http://www.elblogdeldecorador.cl/category/proyectos/page/3/"

# Leyendo el HTML del archivo
blogRodrigo <- read_html(link)

links <- html_nodes(blogRodrigo,".custom")

links <- html_attr(links,"href")


for(link in links){
  print(link)
  link <- link
  
  blogRodrigo <- read_html(link)
}


###Iniciando la extracción de información texto ###

# inicializando la variable archivo con el nombre de mi página
link2 <- "http://www.elblogdeldecorador.cl/category/casa-aldo/"

# Leyendo el HTML del archivo
CasaAldo<- read_html(link2)

links2 <- html_nodes(CasaAldo,".custom")

links2 <- html_attr(links2,"href")


for(link2 in links2){
  print(link2)
  link2 <- link2
  
  CasaAldo <- read_html(link2)

}



