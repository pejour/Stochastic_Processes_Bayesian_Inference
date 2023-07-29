
x <- c(2.21, 5.5, 4.5, 5.7, 8.9, 3.2, 7.1)
y <- c(1.6, 3.4, 1.9, 4.9, 5.3, 3.4, 5.4)


# 2a)
braking_distance <- function(theta) {
  return (dnorm(y, theta[1] + x * theta[2], 1))
}

logL <- function (theta) {
  return (sum(log(braking_distance(theta))))
}


# b
# This function will find prior given theta
log_prior <- function (theta) {
  return (log(dnorm(theta[1], 0, 10)) + log(dnorm(theta[2], 1, 10)))
}






# c
set.seed(42)
N <- 1000

posterior <- rbind(rep(0, N), rep(1, N))

for (i in c(2:N)) {
  post <- posterior[, i-1]
  proposal <- post + c( rnorm(1, 0, 0.1), rnorm(1, 0, 0.2))
  
  loga <- (log_likelihood(proposal) + log_prior_density(proposal) 
           -  log_likelihood(post) - log_prior_density(post))
 
  if ( runif(1) < min(1,exp(loga))){
    posterior[,i] <- proposal
    
  } else {
    posterior[,i] <- post
    
  }
}
x_new <- 10
distance <- seq(from=0, to=10, by=100/N)

post_all <- c()

for (y in distance){
  likelihood <- dnorm(y, posterior[1,] + x_new * posterior[2,], 1)
  post_all <- c(post_all, sum(likelihood) / N)
  
}

plot(distance, post_all, type="l")
abline(v=8, col="blue")

prob_8 = mean(pnorm(8, mean = posterior[1,] + 10 * posterior[2,] , sd = 1))
print(prob_8)