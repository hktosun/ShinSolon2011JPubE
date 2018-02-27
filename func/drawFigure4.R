drawFigure4 <- function(mat){
  d <- as.data.frame(cbind(years, t(mat)))
  d <- melt(d, id.vars = 'years', variable.name = 'series')
  p <- ggplot(d, aes(years, value)) +
    geom_point(aes(colour = series, shape = series)) +
    geom_line(aes(colour = series)) +
    scale_y_continuous(breaks = seq(0.45, 1.15, 0.1)) +
    scale_color_discrete(name = "", labels = c("Change in log earnings","relative change in real earnings (zeros and outliers excluded)","relative change in real earnings (zeros and outliers included)")) +
    scale_shape_manual(name = "", labels = c("Change in log earnings","relative change in real earnings (zeros and outliers excluded)","relative change in real earnings (zeros and outliers included)"), values = c(18, 15, 17))+
    guides(col = guide_legend(ncol = 1)) +
		ggtitle("Fig 4: 90-10 differences in various measures of earnings change")
	p <- figureMakeUp(p)
	return(p)		
}