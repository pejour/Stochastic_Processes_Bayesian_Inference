# 2c

#P_tilde <- rbind(c(0,.5,.5),c(.5,0,.5), c(.5,.5,0))


q1 <- rgamma(1, 3, 4.37)
q2 <- rgamma(1, 4, 11.53)
q3 <- rgamma(1, 3, 12.95)

p12 <- rbeta(1, 2.5, 2.5)
p12 <- rbeta(1, 2.5, 1.5)
p13 <- 1 - p12

p21 <- rbeta(1, 1.5, 1.5)
p21 <- rbeta(1, 1.5, 2.5)
p23 <- 1 - p21

p31_post <- rbeta(1, 2.5, 1.5)
p31 <- rbeta(1, 1.5, 2.5)
p32 <- 1 - p31

Q <- rbind(c(-q1, p12*q1, p13*q1),
           c(p21*q2, -q2, p23*q2),
           c(p31*q3, p32*q3, -q3))
Q

sum(Q[1,]) # Check if rounds up to 0