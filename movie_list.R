###
install.packages("rvest")
##
p<-"http://www.bollywoodhungama.com/directory/movies-list/alphabet/@/page/#/"
a<-LETTERS
u<-c(NULL)
for(i in 1:length(a)){
  b<-  gsub("@",a[i],p)
  c<-gsub("#",2,b)
  url<-(c)
  webpage<-read_html(url)
  rank_data<-html_nodes(webpage,"#movies > div > nav > a:nth-child(7)")
  text<-html_text(rank_data)
  x<-as.integer(text)
  
  for(j in 1:x){
    f<-gsub("#",j,b)
    url<-(f)
    webpage<-read_html(url)
    rank_data<-html_nodes(webpage,"#movies > div > ul")
    text<-html_text(rank_data)
    l<-grep("[a-zA-Z]",strsplit(text,"\n")[[1]],value = TRUE)
    
    for(i in 1:length(l)){u<-c(u,grep("[a-zA-Z]",strsplit(l,"\t")[[i]],value = TRUE))}
    
    v<-data.frame(u)
    write.csv(v,"crawler.csv")
  }
  
}


