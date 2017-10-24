rat<-read_json("ratings.json")
df1<-data.frame();for(i in 1:length(rat)){df<-data.frame(fromJSON(rat[[i]]));df1<-rbind(df1,df)}
df1$imdb<-factor(df1$imdb)
df1$name<-factor(df1$name)
df1$rotten<-factor(df1$rotten)
library(stringr)


  
ratings_imbd<-function(url,movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      
      webpage<-read_html(as.character(url))
      rank_data<-html_nodes(webpage,"#title-overview-widget > div.vital > div.title_block > div > div.ratings_wrapper > div.imdbRating > a > span")
      text<-html_text(rank_data)
      print(text)
      people<-text
      rank_data<-html_nodes(webpage,"#title-overview-widget > div.vital > div.title_block > div > div.ratings_wrapper > div.imdbRating > div.ratingValue > strong > span")
      text<-html_text(rank_data)
      rating<-text
     closeAllConnections()
      out<-list(name=as.character(movie),rating=rating,raters_count=people)
      
      
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


ratings_bh<-function(movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      movie<-tolower(movie)
      x<-("http://www.bollywoodhungama.com/movie/@")
      movie1<-gsub("[^a-z]","-",movie)
      movie1<-gsub("(-{2,4})","-",movie1)
      url<-gsub("@",movie1,x)
      webpage<-read_html(url)
      rank_data<-html_nodes(webpage,"a.bh-open-login")
      text<-html_text(rank_data)
      m<-text[2]
      rating<-str_match_all(text[2],"[0-9]+(\\.[0-9][0-9]?)?")[[1]][,1][1]
      people<-str_match_all(text[2],"[0-9]+(\\.[0-9][0-9]?)?")[[1]][,1][3]
      closeAllConnections()
      out<-list(name=movie,rating=rating,raters_count=people)
      
      
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

ratings_tomatoe<-function(url,movie) {
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      
      webpage<-read_html(as.character(url))
      rank_data<-html_nodes(webpage,"div.audience-info")
      text<-html_text(rank_data)
      
      rating<-str_match_all(text,"[0-9]+(\\.[0-9][0-9]?)?")[[1]][1,1]
      people<-str_match_all(text,"[0-9]+(\\.[0-9][0-9]?)?")[[1]][3,1]
     
      closeAllConnections()
      out<-list(name=as.character(movie),rating=rating,raters_count=people)
      
      
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

  