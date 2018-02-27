cleanDataExcZeros <- function(df){
  df <- cleanData(df)
  df <- excludeZeroEarnings(df)
  df <- dropOutliers(df)
  df <- generateNewVars(df)
  return(df)
}