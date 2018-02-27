generateNewVars <- function(df){
  df <- df %>% mutate(inc_ld = log(inc1/inc0), 
                      wage_ld = log(wage1/wage0), 
                      age0_sq = age0^2,
                      wage1_adj = wage1/cpi1[y],
                      wage0_adj = wage0/cpi0[y],
                      wage_dif = wage1_adj - wage0_adj)
  return(df)
}