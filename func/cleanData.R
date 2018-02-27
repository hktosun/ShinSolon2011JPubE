cleanData <- function(df, year){
				 	
	if(!("excfarmbus0" %in% names(df)) & "farm0" %in% names(df)){
		df <- df %>% mutate(excfarmbus0 = inc0 - farm0 - bus0)
	}
	
	if(!("excfarmbus1" %in% names(df)) & "farm1" %in% names(df)){
		df <- df %>% mutate(excfarmbus1 = inc1 - farm1 - bus1)
	}
  
  if("farm0" %in% names(df)){
    df <- df %>% mutate(excfarmbus_ld = log(excfarmbus1/excfarmbus0))
  }
  

	if(!("inc0" %in% names(df))){
		df <- df %>% mutate(inc0 = excfarmbus0 + bus0, acc_inc0 = 0)
	}

	if(!("inc1" %in% names(df))){
		df <- df %>% mutate(inc1 = excfarmbus1 + bus1, acc_inc1 = 0)
	}
	
  df <- df %>% na.omit %>%
    filter(gender0 == 1,
           gender1 == 1,
           age0 >=25, 
           age0 <= 59,
           age1 >= 25,
           age1 <= 59) %>%
    filter(id_680 < 3000,
           id_681 < 3000) %>%
    filter(acc_wage0 == 0,
           acc_wage1 == 0,
           acc_inc0 == 0,
           acc_inc1 == 0) %>%
    filter(abs(age1 - age0 - 2) <= 1)
  
  if("acc_farm0" %in% names(df)){
    df <- df %>% filter(acc_farm1 ==0,
                        acc_bus1 == 0,
                        acc_wage0 == 0,
                        acc_wage1 == 0)  
    }
	
	
  return(df)
}