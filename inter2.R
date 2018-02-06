M <-length(a_wage_vec)
M1 <- length(a_excfarmbus_vec)

df1 <- data.frame(a_wage_vec, all_years, rep("Wages and Salaries", M))
df2 <- data.frame(a_wage_vec2, all_years, rep("Wages and Salaries with ages 30-54", M))
df3 <- data.frame(a_inc_vec, all_years, rep("Total Labor Income", M))
df4 <- data.frame(a_wage_notcontr_vec, all_years, rep("Wages and Salaries without controlling for age", M))
df5 <- data.frame(a_excfarmbus_vec, all_years[c(7:M)], rep("Total Labor Income Excl. Farm and Business", M1))

fig3_df1 <- data.frame(a_fig3_90_vec, all_years, rep("p90", M))
fig3_df2 <- data.frame(a_fig3_75_vec, all_years, rep("p75", M))
fig3_df3 <- data.frame(a_fig3_50_vec, all_years, rep("median", M))
fig3_df4 <- data.frame(a_fig3_25_vec, all_years, rep("p25", M))
fig3_df5 <- data.frame(a_fig3_10_vec, all_years, rep("p10", M))

fig4_df1 <- data.frame(a_fig4_line1_vec, all_years, rep("change in log earnings", M))
fig4_df2 <- data.frame(a_fig4_line2_vec, all_years, rep("relative change in real earnings (zeros and outliers excluded)", M))
fig4_df3 <- data.frame(a_fig4_line3_vec, all_years, rep("relative change in real earnings (zeros and outliers included)", M))


fig5_df1 <- data.frame(a_fig5_90_vec, all_years, rep("p90", M))
fig5_df2 <- data.frame(a_fig5_75_vec, all_years, rep("p75", M))
fig5_df3 <- data.frame(a_fig5_50_vec, all_years, rep("median", M))
fig5_df4 <- data.frame(a_fig5_25_vec, all_years, rep("p25", M))
fig5_df5 <- data.frame(a_fig5_10_vec, all_years, rep("p10", M))


names(df1) <- c("value","year","class")
names(df2) <- c("value","year","class")
names(df3) <- c("value","year","class")
names(df4) <- c("value","year","class")
names(df5) <- c("value","year","class")

names(fig3_df1) <- c("value","year","class")
names(fig3_df2) <- c("value","year","class")
names(fig3_df3) <- c("value","year","class")
names(fig3_df4) <- c("value","year","class")
names(fig3_df5) <- c("value","year","class")

names(fig4_df1) <- c("value","year","class")
names(fig4_df2) <- c("value","year","class")
names(fig4_df3) <- c("value","year","class")

names(fig5_df1) <- c("value","year","class")
names(fig5_df2) <- c("value","year","class")
names(fig5_df3) <- c("value","year","class")
names(fig5_df4) <- c("value","year","class")
names(fig5_df5) <- c("value","year","class")

df <- do.call("rbind", list(df, df1, df2, df3, df4, df5))
fig3_df <- do.call("rbind", list(fig3_df, fig3_df1, fig3_df2, fig3_df3, fig3_df4, fig3_df5))
fig4_df <- do.call("rbind", list(fig4_df, fig4_df1, fig4_df2, fig4_df3))    
fig5_df <- do.call("rbind", list(fig5_df, fig5_df1, fig5_df2, fig5_df3, fig5_df4, fig5_df5))
