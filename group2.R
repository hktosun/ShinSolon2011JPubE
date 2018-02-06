years <- seq(1977,1992,1);
N <- length(years);

ind0 <- c(86.9, 91.9,  97.7,  104.4, 114.4, 127.1, 139.2, 147.6, 153.9, 160.2, 165.7, 168.7, 174.4, 180.8, 188.6, 198.0)
ind1 <- c(97.7, 104.4, 114.4, 127.1, 139.2, 147.6, 153.9, 160.2, 165.7, 168.7, 174.4, 180.8, 188.6, 198.0, 205.1, 210.3)
all_years <- c(all_years,years)




y <- 1;
setwd("data/group2")
files <- list.files() 
setwd("../..")
while(y <= N){
direct <- paste("data/group2/", files[y],sep="")
data <- read_csv(direct, col_types =cols(.default = "d"));    
data_fig4 <- data

data <- na.omit(data)  %>%
        filter(gender0 == 1,
               gender1 == 1, 
               age0 >= 25, 
               age0 <= 59,
               age1 >= 25,
               age1 <= 59,
               id_680 < 3000,
               id_681 < 3000,
               acc_wage0 == 0,
               acc_wage1 == 0,
               acc_inc0 == 0,
               acc_inc1 == 0, 
               wage0>1, 
               wage1>1,
               inc0>1,
               inc1>1,
               abs(age1 - age0 - 2) <= 1) %>%
        mutate(excfarmbus0 = inc0 - farm0 - bus0, excfarmbus1 = inc1 - farm1 - bus1) 

data2 <- data %>% 
         filter(age0 >= 30, 
                age0 <= 54,
                age1 >= 30,
                age1 <= 54)

data_fig4 <- na.omit(data_fig4)  %>%
        filter(gender0 == 1,
               gender1 == 1, 
               age0 >= 25, 
               age0 <= 59,
               age1 >= 25,
               age1 <= 59,
               id_680 < 3000,
               id_681 < 3000,
               acc_wage0 == 0,
               acc_wage1 == 0,
               acc_inc0 == 0,
               acc_inc1 == 0, 
               abs(age1 - age0 - 2) <= 1)


source("quantile_boundary.r")

data <- data %>% filter(wage0 <= w099,
                        wage0 >= w01,
                        wage1 <= w199,
                        wage1 >= w11) %>% 
                 mutate(inc_ld = log(inc1/inc0), 
                        wage_ld = log(wage1/wage0), 
                        age0_sq = age0*age0,
                        excfarmbus_ld = log(excfarmbus1/excfarmbus0),
                        wage1_adj = wage1/ind1[y],
                        wage0_adj = wage0/ind0[y],
                        wage_dif = wage1_adj - wage0_adj)
data2 <- data2 %>% filter(wage0 <= w2099,
                        wage0 >= w201,
                        wage1 <= w2199,
                        wage1 >= w211) %>% 
                 mutate(inc_ld = log(inc1/inc0), 
                        wage_ld = log(wage1/wage0), 
                        age0_sq = age0*age0)                   
data_fig4 <- data_fig4 %>% 
                   mutate(wage1_adj = wage1/ind1[y],
                          wage0_adj = wage0/ind0[y],
                          wage_dif = wage1_adj - wage0_adj,
                          age0_sq = age0*age0)                                  


reg_excfarmbus <- lm(excfarmbus_ld~age0+age0_sq, data=data)
res_excfarmbus <- residuals(reg_excfarmbus)
a_excfarmbus_vec <- c(a_excfarmbus_vec, sd(res_excfarmbus))
source("inter.r")


y <- y+1;
}
