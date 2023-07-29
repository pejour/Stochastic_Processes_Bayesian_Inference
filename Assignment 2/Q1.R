#b)
f_extinct <- function(s,lambda) abs(exp(lambda*(s-1))-s)

f_singleExtinct <- function(lambda)optimize(function(s) f_extinct(s,lambda),c(0,1))$minimum

branches <- 7
f_fullExtinct <- Vectorize(function(lambda) f_singleExtinct(lambda)^branches)

#c)
f <- Vectorize(function(lambda) f_fullExtinct(lambda)*dgamma(lambda,15,rate=9))
integrate(f,0,Inf)

#d)
### Part 1 ###
set.seed(42)
gamma_dist <- f_fullExtinct(rgamma(100000,15,rate=9))
mean(gamma_dist)

values <- rgamma(100000,15,rate=9)
plot(values.index, values)

### Part 2 ###
n_eval = 100
f_fullExtinct2 <- Vectorize(function(lambda){
  cur_branches <- 7 #Start from a generation with 7 branches, mimicing fig.1
  while(cur_branches > 0){
    if (cur_branches >= n_eval)
      break
    cur_branches = sum(rpois(cur_branches,lambda))
  }
  if(cur_branches==0)return(1)
  else return(0)
})

set.seed(42)
extinct_sim <- f_fullExtinct2(rgamma(100000,15,rate=9))
mean(extinct_sim)

#e)
f_fullExtinct(5/3)
