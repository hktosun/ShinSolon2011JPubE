p =  c(.01, .99)
w01 <- as.vector(quantile(data$wage0,p))[1]
w099 <- as.vector(quantile(data$wage0,p))[2]
w11 <- as.vector(quantile(data$wage1,p))[1]
w199 <- as.vector(quantile(data$wage1,p))[2]

w201 <- as.vector(quantile(data2$wage0,p))[1]
w2099 <- as.vector(quantile(data2$wage0,p))[2]
w211 <- as.vector(quantile(data2$wage1,p))[1] 
w2199 <- as.vector(quantile(data2$wage1,p))[2]
