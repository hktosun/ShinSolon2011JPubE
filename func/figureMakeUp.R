figureMakeUp <- function(p){
	p <- p + theme_bw() +
		scale_x_continuous(breaks = seq(1971,2006,1)) +
		theme(legend.position="bottom", legend.text = element_text(size = 13), plot.title = element_text(hjust = 0.5, size = 15)) +
		labs(shape="", color="") +
		theme(axis.text.x = element_text(angle = 90, vjust = 0.7, size = 11), axis.text.y = element_text(size = 11), panel.grid.major.x= element_blank(), panel.grid.minor = element_blank()) +
		xlab("") +
		ylab("") +
	  theme(legend.position="bottom", legend.background = element_rect(linetype = 1, size = 0.5, colour = 1))
	return(p)
}