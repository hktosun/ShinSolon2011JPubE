summaryStatistics <- function(age_vec, wage_vec){

	df_summary <- data.frame(c("Mean","Median","Std. Dev.","Min","Max","Skewness","Kurtosis", "IQR"), c(mean(age_vec), median(age_vec), sd(age_vec), min(age_vec), max(age_vec), skewness(age_vec), kurtosis(age_vec), IQR(age_vec)), c(mean(wage_vec), median(wage_vec), sd(wage_vec), min(wage_vec), max(wage_vec), skewness(wage_vec), kurtosis(wage_vec), IQR(wage_vec)))
	names(df_summary) <- c("Statistic", "Age", "Wage")
	print(xtable(df_summary, type = "latex"), include.rownames=FALSE, file = "tex/summary_stats.tex")

}
