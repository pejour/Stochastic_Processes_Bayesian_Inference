set.seed(123)

count=0
n = 1000000
y_monday=vector(length=n)
y_tuesday=vector(length=n)
chosenlambdas = vector()

lambda = rgamma(n,6,rate=2)

for(i in 1:n){
  y_monday[i]= rpois(4,lambda[i])
  y_tuesday[i]= rpois(1,lambda[i])
  if(y_monday[i] == 4 && y_tuesday[i] == 1){
    count=count+1
    chosenlambdas[count]=lambda[i]
  }
}

w_count = 0
y_wedsnesday = vector(length=length(chosenlambdas))
for (i in 1:length(chosenlambdas)) {
  y_wedsnesday[i] = rpois(3,chosenlambdas[i])
  if(y_wedsnesday[i] == 3){
    w_count = w_count + 1
  }
}
count/n
w_count/n

