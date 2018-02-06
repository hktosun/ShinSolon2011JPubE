years <- seq(1971,1976,1);
N <- length(years);

ind0 <- c(60.9, 63.9, 66.7, 68.7, 73.0, 80.3)
ind1 <- c(66.7, 68.7, 73.0, 80.3, 86.9, 91.9)

age_vec <- c()
wagesal_vec <- c()
all_years <- c()
all_years <- c(all_years,years)


a_inc_vec <- c()
a_wage_vec <- c()
a_wage_vec2 <- c()
a_excfarmbus_vec <- c()
a_wage_notcontr_vec <- c()

a_fig3_10_vec <- c()
a_fig3_25_vec <- c()
a_fig3_50_vec <- c()
a_fig3_75_vec <- c()
a_fig3_90_vec <- c()

a_fig4_line1_vec <- c()
a_fig4_line2_vec <- c()
a_fig4_line3_vec <- c()

a_fig5_10_vec <- c()
a_fig5_25_vec <- c()
a_fig5_50_vec <- c()
a_fig5_75_vec <- c()
a_fig5_90_vec <- c()


y <- 1;
setwd("data/group1")
files <- list.files() 
setwd("../..")
while(y <= N){
direct <- paste("data/group1/", files[y],sep="")
data <- read_csv(direct, col_types = cols(.default = "d"));    
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
               abs(age1 - age0 - 2) <= 1)  

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



source("inter.r")


y <- y+1;
}
