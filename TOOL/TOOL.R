
# ================== TOOL

library(tidyverse)
library(ggplot2)


df = read_csv('discography_TOOL.csv')

spec(df)

glimpse(df)

summary(df$`Song_Length_(seconds)`)

# ==================
library(ggdark)
library(ggtext)


df %>% 
  mutate(Album = fct_reorder(Album, `Song_Length_(seconds)`)) %>% 
  ggplot( aes(y= Album, x= `Song_Length_(seconds)`))+
  geom_point( alpha=0.3, size=5)+
  dark_mode() +
  labs(x="Song Length (Seconds)") + 
  theme(axis.title = element_markdown(size = 13),
    axis.text = element_markdown(size = 12),
    plot.title = element_markdown(colour = "white"),
    legend.title = element_markdown(size = 12),
    panel.background = element_rect(colour = "black"))


df %>% 
  select(Song_Title, `Song_Length_(seconds)`, Song_Length) %>% 
  mutate(Avg_Song_Length = mean(`Song_Length_(seconds)`)) %>% 
  ggplot( aes(x= `Song_Length_(seconds)`, y= Song_Title ))+
  geom_point(alpha=0.3, size=5)+
  geom_vline(xintercept = 430)+
  dark_mode()+
  labs(x="Song Length (Seconds)", y="Song Title")


mean(df$`Song_Length_(seconds)`)

mean(df$Song_Length)








