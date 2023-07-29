source(file = "../../../Archive/utilities.R")
P = rbind(
  c(0, 1/4, 0,1/4,1/4,0,0,1/4,0,0),
  c(0, 0, 0, 1/2, 1/4, 0, 0, 1/4, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
  c(0, 0, 0, 1/4, 1/4, 0, 1/4, 1/4, 0, 0),
  c(0, 0, 0, 1/4, 1/4, 0, 1/4, 1/4, 0, 0),
  c(0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 1/4, 0, 1/4, 1/4, 0, 1/4),
  c(0, 0, 0, 0, 1/4, 0, 0, 1/2, 0, 1/4),
  c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
)

#Part-a
Q = P[1:9, 1:9] #Without absorbing stage
I = diag(9)

stationary(P)

F = solve(I - Q) #Inverse of the matrix
print(sum(F[1,])) #Sum top row for steps from state 1 to 9

#Part-b
Q2 = P[-c(4,10),-c(4,10)]
I2 = diag(8)
F2 = solve(I2 - Q2)
R2 = P[-c(4, 10),c(4, 10)]

B =  F2%*%R2
print(B[6,1])
