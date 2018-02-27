dropOutliers <- function(df){
  l01 = findPercentile(df$wage0, 0.01)
  l99 = findPercentile(df$wage0, 0.99)
  u01 = findPercentile(df$wage1, 0.01)
  u99 = findPercentile(df$wage1, 0.99)
  
  df <- df %>% filter(wage0 >= l01,
                      wage0 <= l99,
                      wage1 >= u01,
                      wage1 <= u99)
  return(df)
}