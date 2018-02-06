df1 <- data.frame(a_wage_vec, years, rep("Wages and Salaries", N))
df2 <- data.frame(a_wage_vec2, years, rep("Wages and Salaries with ages 30-54", N))
df3 <- data.frame(a_inc_vec, years, rep("Total Labor Income", N))
df4 <- data.frame(a_wage_notcontr_vec, years, rep("Wages and Salaries without controlling for age", N))

fig3_df1 <- data.frame(a_fig3_90_vec, years, rep("p90", N))
fig3_df2 <- data.frame(a_fig3_75_vec, years, rep("p75", N))
fig3_df3 <- data.frame(a_fig3_50_vec, years, rep("median", N))
fig3_df4 <- data.frame(a_fig3_25_vec, years, rep("p25", N))
fig3_df5 <- data.frame(a_fig3_10_vec, years, rep("p10", N))

fig4_df1 <- data.frame(a_fig4_line1_vec, years, rep("change in log earnings", N))
fig4_df2 <- data.frame(a_fig4_line2_vec, years, rep("relative change in real earnings (zeros and outliers excluded)", N))
fig4_df3 <- data.frame(a_fig4_line3_vec, years, rep("relative change in real earnings (zeros and outliers included)", N))

fig5_df1 <- data.frame(a_fig5_90_vec, years, rep("p90", N))
fig5_df2 <- data.frame(a_fig5_75_vec, years, rep("p75", N))
fig5_df3 <- data.frame(a_fig5_50_vec, years, rep("median", N))
fig5_df4 <- data.frame(a_fig5_25_vec, years, rep("p25", N))
fig5_df5 <- data.frame(a_fig5_10_vec, years, rep("p10", N))



names(df1) <- c("value","year","class")
names(df2) <- c("value","year","class")
names(df3) <- c("value","year","class")
names(df4) <- c("value","year","class")

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


df <- do.call("rbind", list(df1, df2, df3, df4))
fig3_df <- do.call("rbind", list(fig3_df1, fig3_df2, fig3_df3, fig3_df4, fig3_df5))
fig4_df <- do.call("rbind", list(fig4_df1, fig4_df2, fig4_df3))
fig5_df <- do.call("rbind", list(fig5_df1, fig5_df2, fig5_df3, fig5_df4, fig5_df5))