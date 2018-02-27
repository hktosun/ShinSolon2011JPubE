getNumbersForFigure2 <- function(df){
	
  df <- cleanDataExcZeros(df)
# Wages & Salaries

	dev_1 = sd(residuals(lm(wage_ld ~ age0 + age0_sq, data = df)))


# Total Labor Income (Dynan et al.)
	
	dev_3 = sd(residuals(lm(inc_ld ~ age0 + age0_sq, data = df)))

# Wages & Salaries without controlling for age
	dev_4 = sd(df$wage_ld)

# Total Labor Income excluding farm & business income
	
	if("excfarmbus0" %in% names(df)){
		dev_5 = sd(residuals(lm(excfarmbus_ld ~ age0 + age0_sq, data = df)))
	}
	else{
		dev_5 = NA;
	}

# Wages & Salaries with ages 30-54

	df <- df %>% filter(age0 >= 30, 
                		age0 <= 54,
                		age1 >= 30,
                		age1 <= 54)

	dev_2 = sd(residuals(lm(wage_ld ~ age0 + age0_sq, data = df)))

return(c(dev_1, dev_2, dev_3, dev_4, dev_5))

}