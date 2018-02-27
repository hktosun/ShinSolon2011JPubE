getNumbersForFigure4 <- function(df){

df2 <- cleanDataIncZeros(df)

res_inc <- residuals(lm(wage_dif ~ age0 + age0_sq, data = df2))/((mean(df2$wage1_adj) + mean(df2$wage0_adj))/2)

df <- cleanDataExcZeros(df)

res_exc <- residuals(lm(wage_dif ~ age0 + age0_sq, data = df))/((mean(df$wage1_adj) + mean(df$wage0_adj))/2)

res_old <- residuals(lm(wage_ld ~ age0 + age0_sq, data = df))

dev_1 <- findPercentile(res_old, 0.90) - findPercentile(res_old, 0.10)
dev_2 <- findPercentile(res_exc, 0.90) - findPercentile(res_exc, 0.10)
dev_3 <- findPercentile(res_inc, 0.90) - findPercentile(res_inc, 0.10)

return(c(dev_1, dev_2, dev_3))

}