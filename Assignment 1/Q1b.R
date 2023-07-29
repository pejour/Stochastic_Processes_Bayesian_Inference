k <- 200
p <- seq(0, 8, length.out=k)

#calculate a:
a <- dgamma(p,6,2)


#calculate b:
b <- dpois(1, a)*dpois(4,a)

#calculate c:
c <- (a * b)/sum(a*b)

d <- dpois(3, p)
sum(c*d)

