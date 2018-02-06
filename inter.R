age_vec <- c(age_vec, as.vector(data$age0))
wagesal_vec <- c(wagesal_vec, as.vector(data$wage0))
reg_inc = lm(inc_ld~age0+age0_sq,data=data)
reg_wage = lm(wage_ld~age0+age0_sq,data=data)
reg2_wage = lm(wage_ld~age0+age0_sq,data=data2)

res_inc <- residuals(reg_inc)
res_wage <- residuals(reg_wage)
res2_wage <- residuals(reg2_wage)


a_inc_vec <- c(a_inc_vec, sd(res_inc))
a_wage_vec <- c(a_wage_vec, sd(res_wage))
a_wage_notcontr_vec <- c(a_wage_notcontr_vec, sd(data$wage_ld))
a_wage_vec2 <- c(a_wage_vec2, sd(res2_wage))


a_fig3_10_vec <- c(a_fig3_10_vec, as.vector(quantile(res_wage,0.10))[1])
a_fig3_25_vec <- c(a_fig3_25_vec, as.vector(quantile(res_wage,0.25))[1])
a_fig3_50_vec <- c(a_fig3_50_vec, as.vector(quantile(res_wage,0.50))[1])
a_fig3_75_vec <- c(a_fig3_75_vec, as.vector(quantile(res_wage,0.75))[1])
a_fig3_90_vec <- c(a_fig3_90_vec, as.vector(quantile(res_wage,0.90))[1])


reg_wage_dif_exc <- lm(wage_dif~age0+age0_sq,data=data)
res_wage_dif_exc <- residuals(reg_wage_dif_exc)
res_wage_dif_exc <- res_wage_dif_exc/((mean(data$wage1_adj) + mean(data$wage0_adj))/2)

reg_wage_dif_inc <- lm(wage_dif~age0+age0_sq,data=data_fig4)
res_wage_dif_inc <- residuals(reg_wage_dif_inc)
res_wage_dif_inc <- res_wage_dif_inc/((mean(data_fig4$wage1_adj) + mean(data_fig4$wage0_adj))/2)

a_fig4_line1_vec <- c(a_fig4_line1_vec, a_fig3_90_vec[y] - a_fig3_10_vec[y])
a_fig4_line2_vec <- c(a_fig4_line2_vec, as.vector(quantile(res_wage_dif_exc,0.90))[1] - as.vector(quantile(res_wage_dif_exc,0.10))[1])
a_fig4_line3_vec <- c(a_fig4_line3_vec, as.vector(quantile(res_wage_dif_inc,0.90))[1] - as.vector(quantile(res_wage_dif_inc,0.10))[1])

a_fig5_10_vec <- c(a_fig5_10_vec, as.vector(quantile(res_wage_dif_exc,0.10))[1])
a_fig5_25_vec <- c(a_fig5_25_vec, as.vector(quantile(res_wage_dif_exc,0.25))[1])
a_fig5_50_vec <- c(a_fig5_50_vec, as.vector(quantile(res_wage_dif_exc,0.50))[1])
a_fig5_75_vec <- c(a_fig5_75_vec, as.vector(quantile(res_wage_dif_exc,0.75))[1])
a_fig5_90_vec <- c(a_fig5_90_vec, as.vector(quantile(res_wage_dif_exc,0.90))[1])