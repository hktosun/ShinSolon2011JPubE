excludeZeroEarnings <- function(df){
  df <- df %>% filter(wage0 > 1, 
                      wage1 > 1,
                      inc0  > 1,
                      inc1  > 1)
  return(df)
}