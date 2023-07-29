#1a: 
lambda <- 36
lower_bound <- 6-1
Area = (0.6-0.2)**2

pois_lower <- ppois(lower_bound, Area*lambda)

#Take the inverse for > 6:
result = 1-pois_lower
result

#1b:
Area_int <- 0.2**2
lambda <- 36
result <- 0
pois_int <- 0

for (k in 0:4) {
  pois_int <- pois_int + dpois(k,Area_int*lambda) * (dpois(4-k, 3*Area_int*lambda))**2
}
pois_int

#1c
lambda = 36
Area <- (1.0 - 0.0)**2

N <- rpois(1,lambda)
x <- runif(N, 0, 1)
y <- runif(N, 0, 1)

plot(x,y, main = paste(N, "trees (~ Poisson), \n Normally distributed"))


#1d
posterior <- rgamma(1, 36, rate = 1)

N <- rpois(1,posterior)
x <- runif(N, 0, 1)
y <- runif(N, 0, 1)
plot(x,y, main = paste(N, "trees (~ Poisson, gamma prior), \n Normally distributed"))


#1e
set.seed(42)

# Create the data
runs <- 10000
result = vector(mode="double", length = runs)
for (iteration in 1:runs) {
  N <- rgamma(1, 36, rate = 1)
  x <- runif(N, 0, 1)
  y <- runif(N, 0, 1)
  
  dist <- 0
  for (i in 1:N) {
    tmp_dist <- vector(mode="double", length=N)
    for (j in 1:N){
      if (i != j){
        cur_x = x[j]
        cur_y = y[j]
        
        tmp_dist[j] <-sqrt( (x[i]-cur_x)**2 + (y[i]-cur_y)**2)
      }
      else {
        tmp_dist[j] <- 99999 #High number to avoid 0 being chosen at min()
      }
    dist = dist + min(tmp_dist)
    }
  }
  result[iteration] = (dist/N)
}

 #Plot the histogram
hist(result)

#1f
mean <- mean(result)
std <- sd(result)
max_res <- max(result)

(0.1358 - mean)/std

