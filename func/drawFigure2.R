drawFigure2 <- function(mat){
  d <- as.data.frame(cbind(years, t(mat)))
  d <- melt(d, id.vars = 'years', variable.name = 'series')
  p <- ggplot(d, aes(years, value)) +
    geom_point(aes(colour = series, shape = series)) +
    geom_line(aes(colour = series)) +
    scale_y_continuous(breaks = seq(0.2, 0.65, 0.05)) +
    scale_color_discrete(name = "", labels = c("Wages & salaries", "Wages & salaries with ages 30-54", "Total Labor Income (Dynan et al.)", "Wages & salaries without controlling for age", "Total Labor Income excluding farm & business income")) +
    scale_shape_manual(name = "", values = c(18, 17, 16, 8, 15), labels = c("Wages & salaries", "Wages & salaries with ages 30-54", "Total Labor Income (Dynan et al.)", "Wages & salaries without controlling for age", "Total Labor Income excluding farm & business income")) + 
    guides(col = guide_legend(ncol = 2)) +
    ggtitle("Fig 2: Standard deviation of age-adjusted change in log earnings with various earnings measures.")
  p <- figureMakeUp(p)
  return(p)		
}