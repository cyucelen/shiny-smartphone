library(shiny)
library(tidytext)
library(dplyr)

convertToDataFrame <- function(data, sampleSize = length(data)){
  samples <- sample(data, sampleSize)  
  dataFrame <- data_frame(line = 1:sampleSize,text=samples)
  
  return(dataFrame)
}

getWords <- function(text_df){
  words <- text_df %>%
    unnest_tokens(word, text)
  
  return(words)
}

countWords <- function(words){
  counts <- words %>%
    count(word, sort = TRUE)
  
  return(counts)
}

shinyServer(function(input, output) {
  
  output$count <- renderText(
    twitterWordCounts[
      grep(
        paste("^",input$mainInput,"$", sep=""),twitterWordCounts$word
      ), ]$n
    )
  
})

twitterTextLines <- readLines(con ="../final/en_US/en_US.twitter.txt")
twitter_df <- convertToDataFrame(twitterTextLines, 10000)
twitterWords <- getWords(twitter_df)
twitterWordCounts <- countWords(twitterWords)
print(
  twitterWordCounts[
    grep(paste("^","hey","$", sep=""),twitterWordCounts$word), ]$n)


      