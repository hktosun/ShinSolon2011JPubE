drawFigure5 <- function(d){
  d <- melt(d, id.vars = 'year', variable.name = 'series')
  p <- ggplot(d, aes(year, value)) +
    geom_point(aes(colour = series, shape = series)) +
    geom_line(aes(colour = series)) +
    scale_shape_manual(name = "", labels = c("p90","p75","median","p25","p10"), values = c(18, 15, 17, 4, 16))+
    scale_y_continuous(breaks = seq(-0.4,0.4,0.1)) +
    scale_color_discrete(name = "", labels = c("p90","p75","median","p25","p10")) +
    guides(col = guide_legend(ncol = 5)) +
		ggtitle("Fig 5: Quantiles of relative age-adjusted change in real earnings (zeros and outliers excluded)")
	p <- figureMakeUp(p)
	return(p)		
}