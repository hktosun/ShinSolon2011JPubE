getNumbersForFigure3 <- function(df){

  df <- cleanDataExcZeros(df)

	res_wage <- residuals(lm(wage_ld ~ age0 + age0_sq, data = df))

	p90 <- findPercentile(res_wage, 0.90)
	p75 <- findPercentile(res_wage, 0.75)
	p50 <- findPercentile(res_wage, 0.50)
	p25 <- findPercentile(res_wage, 0.25)
	p10 <- findPercentile(res_wage, 0.10)

	return(c(p90, p75, p50, p25, p10))
}
