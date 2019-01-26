###Iniciando la extracción de información Links ###

# Usando la librería rvest
library(rvest)


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

#limpiar texto
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



#_________2.- Iniciando la extracción  links __________________

Enlace <- "http://www.elblogdeldecorador.cl/category/proyectos/"

# Leyendo el HTML del archivo
ProyectosRealizados<- read_html(Enlace)

Enlaces <- html_nodes(ProyectosRealizados,".custom")

Enlaces <- html_attr(Enlaces,"href")


for(Enlace in Enlaces){
  print(Enlace)
  Enlace <- Enlace
  
  ProyectosRealizados <- read_html(Enlace)
}

#_________3.-hora es tiempo de extarer links de contenido subidos por Rodrigo._______________

conteoLinks <- 0
for(i in 1:10){
  link <- paste("http://www.elblogdeldecorador.cl/category/casa-de-rodrigo/page/",i,sep = "")
  
  print(link)

  # aquì pegue la lògica para extraer los links
  # conteoLinks <- conteoLinks + length(linksExtraidos)
  CasaRodrigo <- read_html(link)

links <- html_nodes(CasaRodrigo,".custom")

links <- html_attr(links,"href")
conteoLinks <- conteoLinks + length(links)

}

for(link in links) {
  print(link)
  link <- link
  
  link <- read_html(link)
}

#_________4.-hora es tiempo de extarer links de contenido subidos por Aldo._______________

conteoLinks2 <- 0
for(i in 1:15){
  link2 <- paste("http://www.elblogdeldecorador.cl/category/casa-aldo/page/",i,sep = "")
  
  print(link2)
  
  # aquì pegue la lògica para extraer los links
  # conteoLinks <- conteoLinks + length(linksExtraidos)
  CasaAldo <- read_html(link2)
  
  links2 <- html_nodes(CasaAldo,".custom")
  
  links2 <- html_attr(links2,"href")
  conteoLinks2 <- conteoLinks2 + length(links2)
  
}

 for(link2 in links2) {
  print(link2)
  link2 <- link2
  
  link2 <- read_html(link2)
 }












