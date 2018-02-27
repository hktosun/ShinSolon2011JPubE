cleanDataIncZeros <- function(df){
  df <- cleanData(df)
  df <- dropOutliers(df)
  df <- generateNewVars(df)
  return(df)
}