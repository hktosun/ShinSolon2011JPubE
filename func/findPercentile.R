findPercentile <- function(x,p){
	return(as.vector(quantile(x, p)))
}