library(ggplot2)
read.csv("ratings.csv")
data1 <- read.csv('ratings.csv', sep = ',', h = TRUE)
plot(data1)

read.csv("tags.csv")
data3 <- read.csv('tags.csv', sep = ',', h = TRUE)

read.csv("movies.csv")
data2 <- read.csv('movies.csv', sep = ',', h = TRUE)
plot(data2)

d1 <- merge(data1, data2)

d2 = head(d1, n = 1000)
names(d2)
plot(d2)

qplot(title, userId, data = d2, color = title, size = userId, alpha = I(0.7))

d3 <- subset(d2, data2$genres == "Comedy")
plot(d3)
names(d3)
qplot(title, rating, data = d3, color = title, size = rating, geom = "line", alpha = I(0.7))

d4 <- merge(data2,data3)
d5 = head(d4, n = 1000)
qplot(title, tag, data = d5, color = title, size = tag, geom = "line", alpha = I(0.7))
?bipartite graph layout

relation <- lm(d2$rating ~ d2$title)
a<- data.frame(d2$rating > 3)
result1 <- predict(relation, a)
print(result1)
str(d2)

