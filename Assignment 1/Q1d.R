#Question D
f1 <- function(x) (dpois(3,x)*dpois(4,x)*dpois(1,x) * exp(- ((x-3)^2) /8)       )
f2 <- function(x) (dpois(4,x)*dpois(1,x) * exp(- ((x-3)^2) /8))
int1 <- integrate(f1, 0, 6)$value
int2 <- integrate(f2, 0, 6)$value

int1 
int2
int1/int2
