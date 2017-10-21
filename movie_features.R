boxoffice <- function(movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      library(rvest)
      library(jsonlite)
      library(stringr)
      message("This is the 'try' part")
      movie<-tolower(movie)
      x<-("http://www.bollywoodhungama.com/movie/@/box-office/")
      movie1<-gsub("[^a-z]","-",movie)
      movie1<-gsub("(-{2,4})","-",movie1)
      url<-gsub("@",movie1,x)
      webpage<-read_html(url)
      rank_data<-html_nodes(webpage,"td.lifetime")
      text<-html_text(rank_data)
      m<-text[2]
      x<-("http://www.bollywoodhungama.com/movie/@/cast/")
      url<-gsub("@",movie1,x)
      webpage<-read_html(url)
      rank_data<-html_nodes(webpage,"a.cast-name")
      text<-html_text(rank_data)
      n<-text
      rank_data<-html_nodes(webpage,"#cast-n-crew-page > div > ul:nth-child(1) > li:nth-child(3) > ul > li > span")
      text<-html_text(rank_data)
      o<-text
      rank_data<-html_nodes(webpage,"#cast-n-crew-page > div > ul:nth-child(1) > li:nth-child(1) > ul > li > a > span")
      text<-html_text(rank_data)
      p<-text
      print(movie)
      closeAllConnections()
      out<-list(name=movie,boxoffice=m,cast=n,release_date=o,banner=p)
      # The return value of `readLines()` is the actual value 
      # that will be returned in case there is no condition 
      # (e.g. warning or error). 
      # You don't need to state the return value via `return()` as code 
      # in the "try" part is not wrapped insided a function (unlike that
      # for the condition handlers for warnings and error below)
    },
    error=function(cond) {
      message(paste("URL does not seem to exist:", url))
      # Choose a return value in case of error
      return(NULL)
    },
    warning=function(cond) {
     
      message(cond)
      # Choose a return value in case of warning
      return(NULL)
    },
    finally={
      # NOTE:
      # Here goes everything that should be executed at the end,
      # regardless of success or error.
      # If you want more than one expression to be executed, then you 
      # need to wrap them in curly brackets ({...}); otherwise you could
      # just have written 'finally=<expression>' 
      message("Some other message at the end")
    }
  )    
  return(out)
}

cast<-function(movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      
      message("This is the 'try' part")
      
      x<-("http://www.bollywoodhungama.com/movie/@/cast/")
      movie<-gsub("[^a-z]","-",movie)
      movie<-gsub("(-{2,4})","-",movie)
      url<-gsub("@",movie,x)
      webpage<-read_html(url)
      rank_data<-html_nodes(webpage,"a.cast-name")
      text<-html_text(rank_data)
      out<-c(text)
      out
      # The return value of `readLines()` is the actual value 
      # that will be returned in case there is no condition 
      # (e.g. warning or error). 
      # You don't need to state the return value via `return()` as code 
      # in the "try" part is not wrapped insided a function (unlike that
      # for the condition handlers for warnings and error below)
    },
    error=function(cond) {
      message(paste("URL does not seem to exist:", url))
      # Choose a return value in case of error
      return(NULL)
    },
    warning=function(cond) {
      
      message(cond)
      # Choose a return value in case of warning
      return(NULL)
    },
    finally={
      # NOTE:
      # Here goes everything that should be executed at the end,
      # regardless of success or error.
      # If you want more than one expression to be executed, then you 
      # need to wrap them in curly brackets ({...}); otherwise you could
      # just have written 'finally=<expression>' 
      message("Some other message at the end")
    }
  )    
  return(out)
}

releasedate<-function(movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      
      message("This is the 'try' part")
      
      x<-("http://www.bollywoodhungama.com/movie/@/cast/")
      movie<-gsub("[^a-z]","-",movie)
      movie<-gsub("(-{2,4})","-",movie)
      url<-gsub("@",movie,x)
      webpage<-read_html(url)
      rank_data<-html_nodes(webpage,"#cast-n-crew-page > div > ul:nth-child(1) > li:nth-child(3) > ul > li > span")
      text<-html_text(rank_data)
      text
      
      # The return value of `readLines()` is the actual value 
      # that will be returned in case there is no condition 
      # (e.g. warning or error). 
      # You don't need to state the return value via `return()` as code 
      # in the "try" part is not wrapped insided a function (unlike that
      # for the condition handlers for warnings and error below)
    },
    error=function(cond) {
      message(paste("URL does not seem to exist:", url))
      # Choose a return value in case of error
      return(NULL)
    },
    warning=function(cond) {
      
      message(cond)
      # Choose a return value in case of warning
      return(NULL)
    },
    finally={
      # NOTE:
      # Here goes everything that should be executed at the end,
      # regardless of success or error.
      # If you want more than one expression to be executed, then you 
      # need to wrap them in curly brackets ({...}); otherwise you could
      # just have written 'finally=<expression>' 
      message("Some other message at the end")
    }
  )    
  return(out)
}

banner<-function(movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      
      message("This is the 'try' part")
      
      x<-("http://www.bollywoodhungama.com/movie/@/cast/")
      movie<-gsub("[^a-z]","-",movie)
      movie<-gsub("(-{2,4})","-",movie)
      print(movie)
      url<-gsub("@",movie,x)
      webpage<-read_html(url)
      rank_data<-html_nodes(webpage,"#cast-n-crew-page > div > ul:nth-child(1) > li:nth-child(1) > ul > li > a > span")
      text<-html_text(rank_data)
      out<-text
      out
      # The return value of `readLines()` is the actual value 
      # that will be returned in case there is no condition 
      # (e.g. warning or error). 
      # You don't need to state the return value via `return()` as code 
      # in the "try" part is not wrapped insided a function (unlike that
      # for the condition handlers for warnings and error below)
    },
    error=function(cond) {
      message(paste("URL does not seem to exist:", url))
      # Choose a return value in case of error
      return(NULL)
    },
    warning=function(cond) {
      
      message(cond)
      # Choose a return value in case of warning
      return(NULL)
    },
    finally={
      # NOTE:
      # Here goes everything that should be executed at the end,
      # regardless of success or error.
      # If you want more than one expression to be executed, then you 
      # need to wrap them in curly brackets ({...}); otherwise you could
      # just have written 'finally=<expression>' 
      message("Some other message at the end")
    }
  )    
  return(out)
}
