rm(list = ls(all=TRUE))

library("tidyverse")
library("e1071")
library("reshape2")

setwd("func")
files.sources = list.files()
sapply(files.sources, source)
setwd("..")

years <- c(seq(1971,1996,1), seq(1998,2006,2));

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

rm(cpi0, cpi1, files, files.sources, y)


ggsave("fig/fig2.png", plot = drawFigure2(mat2), width = 12, height = 6)
ggsave("fig/fig3.png", plot = drawFigure3(mat3), width = 12, height = 6)
ggsave("fig/fig4.png", plot = drawFigure4(mat4), width = 12, height = 6)
ggsave("fig/fig5.png", plot = drawFigure5(mat5), width = 12, height = 6)




