library("tidyverse")
library("e1071")
library("reshape2")
library("xtable")


files.sources = list.files("func", full.names = TRUE)
sapply(files.sources, source)

years <- c(seq(1971,1996,1), seq(1998,2006,2));

if("data" %in% list.files()){
  T <- length(years)
  
  cpi0 <- c(60.9, 63.9, 66.7, 68.7, 73.0, 80.3, 86.9, 91.9,  97.7,  104.4, 114.4, 127.1, 139.2, 147.6, 153.9, 160.2, 165.7, 168.7, 174.4, 180.8, 188.6, 198.0, 205.1, 210.3, 215.5, 220.1, 231.4, 239.7, 252.9, 264.2, 277.4)
  cpi1 <- c(66.7, 68.7, 73.0, 80.3, 86.9, 91.9, 97.7, 104.4, 114.4, 127.1, 139.2, 147.6, 153.9, 160.2, 165.7, 168.7, 174.4, 180.8, 188.6, 198.0, 205.1, 210.3, 215.5, 220.1, 225.4, 231.4, 239.7, 252.9, 264.2, 277.4, 296.1)
  
  age_vec <- c()
  wage_vec <- c()
  mat2 <- matrix(nrow = 5, ncol = 0);
  mat3 <- matrix(nrow = 5, ncol = 0);
  mat4 <- matrix(nrow = 3, ncol = 0);
  mat5 <- matrix(nrow = 5, ncol = 0);
  
  files <- list.files("data") 
  
  for(y in 1:T){
  	data <- read_csv(paste("data/", files[y], sep=""), col_types = cols(.default = "d"));    
  	
  	df_c <- cleanDataExcZeros(data)
  	age_vec <- c(age_vec, as.vector(df_c$age0))
  	wage_vec <- c(wage_vec, as.vector(df_c$wage0))
  	
  	mat2 <- cbind(mat2, getNumbersForFigure2(data))
  	mat3 <- cbind(mat3, getNumbersForFigure3(data))
  	mat4 <- cbind(mat4, getNumbersForFigure4(data))
  	mat5 <- cbind(mat5, getNumbersForFigure5(data))
  }

 
  summaryStatistics(age_vec, wage_vec)
  
  rm(cpi0, cpi1, files, files.sources, y, df_c, data, age_vec, wage_vec)
  
  write.table(cbind(years, t(mat2)), file="output/fig2data.txt", sep = ",", row.names=FALSE, col.names=c("year", "Wages & salaries", "Wages & salaries with ages 30-54", "Total Labor Income (Dynan et al.)", "Wages & salaries without controlling for age", "Total Labor Income excluding farm & business income"))
  write.table(cbind(years, t(mat3)), file="output/fig3data.txt", sep = ",", row.names=FALSE, col.names=c("year", "p90","p75","median","p25","p10"))
  write.table(cbind(years, t(mat4)), file="output/fig4data.txt", sep = ",", row.names=FALSE, col.names=c("year", "Change in log earnings","relative change in real earnings (zeros and outliers excluded)","relative change in real earnings (zeros and outliers included)"))
  write.table(cbind(years, t(mat5)), file="output/fig5data.txt", sep = ",", row.names=FALSE, col.names=c("year", "p90","p75","median","p25","p10"))
}

plotFigures()



