plotFigures <- function(){

	d2 <- read_delim("output/fig2data.txt", delim = ",")
	d3 <- read_delim("output/fig3data.txt", delim = ",")
	d4 <- read_delim("output/fig4data.txt", delim = ",")
 	d5 <- read_delim("output/fig5data.txt", delim = ",")

	ggsave("img/fig2.png", plot = drawFigure2(d2), width = 12, height = 6)
	ggsave("img/fig3.png", plot = drawFigure3(d3), width = 12, height = 6)
	ggsave("img/fig4.png", plot = drawFigure4(d4), width = 12, height = 6)
	ggsave("img/fig5.png", plot = drawFigure5(d5), width = 12, height = 6)

}