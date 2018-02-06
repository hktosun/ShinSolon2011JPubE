fig2 <- ggplot(df, aes(year,value, group=class)) +
  geom_point(aes(color=class, shape = class))+
  geom_line(aes(color=class))+
  scale_x_continuous(breaks = seq(1971,2006,1)) +
  scale_y_continuous(breaks = seq(0.2,0.65,0.05)) +
  theme(legend.position="bottom", legend.text = element_text(size = 15), plot.title = element_text(hjust = 0.5, size = 18)) +
  labs(shape="", color="") +
  guides(col = guide_legend(ncol = 2)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.7, size = 13), axis.text.y = element_text(size = 13)) +
  xlab("") +
  ylab("") +
  ggtitle("Fig 2: Standard deviation of age-adjusted change in log earnings with various earnings measures")

ggsave("fig2.png")  

fig3 <- ggplot(fig3_df, aes(year,value, group=class)) +
  geom_point(aes(color=class, shape = class))+
  geom_line(aes(color=class))+
  scale_x_continuous(breaks = seq(1971,2006,1)) +
  scale_y_continuous(breaks = seq(-0.8,0.6,0.1)) +
  theme(legend.position="bottom", legend.text = element_text(size = 15), plot.title = element_text(hjust = 0.5, size = 18)) +
  labs(shape="", color="") +
  guides(col = guide_legend(ncol = 1)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.7, size = 13), axis.text.y = element_text(size = 13)) +
  xlab("") +
  ylab("") +
  ggtitle("Fig 3: Quantiles of age-adjusted change in log earnings")

ggsave("fig3.png")  


fig4 <- ggplot(fig4_df, aes(year,value, group=class)) +
  geom_point(aes(color=class, shape = class))+
  geom_line(aes(color=class))+
  scale_x_continuous(breaks = seq(1971,2006,1)) +
  scale_y_continuous(breaks = seq(0.45,1.15,0.1)) +
  theme(legend.position="bottom", legend.text = element_text(size = 15), plot.title = element_text(hjust = 0.5, size = 18)) +
  labs(shape="", color="") +
  guides(col = guide_legend(ncol = 1)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.7, size = 13), axis.text.y = element_text(size = 13)) +
  xlab("") +
  ylab("") +
  ggtitle("Fig 4: 90-10 differences in various measures of earnings change")

ggsave("fig4.png")  


fig5 <- ggplot(fig5_df, aes(year,value, group=class)) +
  geom_point(aes(color=class, shape = class))+
  geom_line(aes(color=class))+
  scale_x_continuous(breaks = seq(1971,2006,1)) +
  scale_y_continuous(breaks = seq(-0.4,0.4,0.1)) +
  theme(legend.position="bottom", legend.text = element_text(size = 15), plot.title = element_text(hjust = 0.5, size = 18)) +
  labs(shape="", color="") +
  guides(col = guide_legend(ncol = 1)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.7, size = 13), axis.text.y = element_text(size = 13)) +
  xlab("") +
  ylab("") +
  ggtitle("Fig 5: Quantiles of relative age-adjusted change in real earnings (zeros and outliers excluded)")

ggsave("fig5.png")  