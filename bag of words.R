data = read.csv("us_youtube_cleaned.csv")
corpus <- Corpus(VectorSource(data$title))
library(tm)
##Cleaning 
corpus <-tm_map(corpus, tolower) 
#remove punctuations
corpus <-tm_map(corpus, removePunctuation)
#remove numbers
corpus <-tm_map(corpus, removeNumbers)
#remove common words-they dont add any informational value
#use the stopwords function in english
#select stopwords(english) to see what words are removed
cleanset <-tm_map(corpus, removeWords, stopwords('english'))
#remove URLs (https://etc.)
#make use of function http
removeURL <- function(x) gsub("http[[:alnum:]]*", '', x)
cleanset <-tm_map(cleanset, content_transformer(removeURL))
##stemming 
cleanset <- tm_map(cleanset, stemDocument,language = "english")

#remove white spaces
cleanset <- tm_map(cleanset, stripWhitespace)


#lets now provide some structure to tweets by creating a matrix of rows/coloums
#this is called term document matrix (tdm)
#Create term document matrix

tdm <- TermDocumentMatrix(cleanset)
tdm
##tdm1
tdm1 = DocumentTermMatrix(cleanset)
new_docterm_corpus <- removeSparseTerms(tdm1,sparse = 0.985)
#if you would like to look at this matrix, you have to convert this into matrix first
tdm <- as.matrix((new_docterm_corpus))
dim(tdm)
df = data.frame(tdm[1:6254,1:18])
dim(tdm)
sort(rowSums(tdm), decreasing=TRUE)
head(win)
data.frame(tdm[1:6254,1:56973])
win = cbind(data,df)



