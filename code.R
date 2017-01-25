library(ggplot2)
library(plyr)

data1 <- read.csv('links.csv', sep = ',', h = TRUE)

data2 <- read.csv('movies.csv', sep = ',', h = TRUE)

data3 <- read.csv('ratings.csv', sep = ',', h = TRUE)

data4 <- read.csv('tags.csv', sep = ',', h = TRUE)



#Density Graph

ggplot(d2, aes(x=rating,fill=genres), main = "Density Plot for Genres") +  geom_density()





#Movies with high rating genre and least genre

d1 <- merge(data1, data2)
d2 = head(d1,n=1000)
qplot(movieId, userId, data = d2, color = genres , geom = "point",alpha = I(1.0))



#Piechart-ratings per movies
library(plotrix)
slices <-c(3326,13407,20064,47011,15095)
slices
a <- c("1 - ","2 - ","3 - ","4 - ","5 - ")
a
pc <-round(slices/sum(slices)*100)
pc
a <- paste(a, pct) # add percents to labels
a <- paste(a,"%",sep="") # ad % to labels
pie(slices,labels = a, col=rainbow(length(a)), main="Ratings")


#Histogram on Rating

hist(d1$rating, col = "red", main = "Histogram for Rating", xlab = "Rating")



#Timestamp

qplot(rating, timestamp, data = d2, size= movieId,color  =movieId, geom = "point", alpha = I(0.7))




# top 10 movie graph and table

data3$userId <- NULL
d1 <- join(data2, data3, by="movieId", type="right") # Merges two datasets based on movieID
d2 <- subset(d1, rating == 5) #Gets data that have rating 5
d3 <- subset(d2, genres == "Adventure|Animation|Children|Comedy|Fantasy") 
top <- data.frame(unique(d3$title,incomparables = FALSE), d3$movieId) # DIstinct based on title
d3 <- head(top, n = 10)
qplot(d3.movieId, unique.d3.title..incomparables...FALSE., data = d3, color = unique.d3.title..incomparables...FALSE., xlab = "movieId", ylab = "top_movies", alpha = I(0.7))
qplot(title, rating, data = d3, color = rating, size = movieId, alpha = I(0.7))
d111 <- rename(d3,c("unique.d3.title..incomparables...FALSE." ="title","d3.movieId"="movieId"))
qplot(movieId,title,  data = d111, color = title,size = 10, geom = "point",alpha = I(1.0),main="Top 10 Movies based on Genre")


#Top Movie

qplot(data = d2, timestamp, title, geom = c("line","point"), main = "Top Rated ", alpha = I(1.0))
