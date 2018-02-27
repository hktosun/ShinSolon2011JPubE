getNumbersForFigure5 <- function(df){
	
  df <- cleanDataExcZeros(df)
  
	res_inc <- residuals(lm(wage_dif ~ age0 + age0_sq, data = df))/((mean(df$wage1_adj) + mean(df$wage0_adj))/2)

	p90 <- findPercentile(res_inc, 0.90)
	p75 <- findPercentile(res_inc, 0.75)
	p50 <- findPercentile(res_inc, 0.50)
	p25 <- findPercentile(res_inc, 0.25)
	p10 <- findPercentile(res_inc, 0.10)

	return(c(p90, p75, p50, p25, p10))
}