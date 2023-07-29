#Question C
f1 <- function(x) (dpois(3,x)*dpois(4,x)*dpois(1,x) * dgamma(x,6,2)       )
f2 <- function(x) (dpois(4,x)*dpois(1,x) * dgamma(x,6,2))
int1 <- integrate(f1, 0, 7)$value
int2 <- integrate(f2, 0, 7)$value

int1 
int2
int1/int2

