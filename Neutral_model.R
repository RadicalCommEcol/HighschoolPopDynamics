Now lets play with a neutral model


```{r}
library('plot.matrix')
# numeric matrix
x <- matrix(runif(35), ncol=5) # create a numeric matrix object
par(mar=c(5.1, 4.1, 4.1, 4.1)) # adapt margins
plot(x, las = 1)

#generate random species
n <- 8 #species
x <- matrix(sample(1:n, size = 100, replace = TRUE), ncol=10) 
plot(x, las = 1, col = 1:8)
original <- x

for(t in 1:tiempo){
  #select one cell to die
  i <- sample(1:nrow(x), 1)
  j <- sample(1:ncol(x), 1)
  #and replace it by 1 born at random among the neibourgs
  nei <- sample(c(1:4,6:9), 1) #for an 8 neibourgs solution
  if(1 < i && i < 10 && 1 < j && j < 10){ #esto descarta el borde... por ahora vale, pero es feo
    born <- x[(i-1):(i+1),(j-1):(j+1)][nei]
    x[i,j] <- born
    plot(x, las = 1, col = 1:8)
  }
}

#SAD
barplot(sort(table(original), decreasing = TRUE))
barplot(sort(table(x), decreasing = TRUE))
#SAR
richness <- c()
for(i in 1:7){
  richness[i] <- length(unique(as.vector(x[1:i,1:i])))
}
plot(richness, t = "l")
```

