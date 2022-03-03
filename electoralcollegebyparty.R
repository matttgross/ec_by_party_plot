library(tidyverse)
library(ggtext)
library(glue)
library(showtext)

df <- data.frame(party=c("Democrats",  "Republicans", "Independents"),
                 favorable = c(69, 16, 40))

df$party <- factor(df$party, levels=c("Democrats", "Republicans", "Independents"))


font_add_google(
  name="Roboto Mono",
  family = "Roboto Mono")
showtext_auto()

df %>%
  ggplot(aes(x=party, y=favorable, fill=party)) +
  geom_col(width = 0.5, alpha=0.5)+
  scale_fill_manual(values = c("Democrats"="blue", "Republicans" = "red", "Independents" = "green"))+
  labs(title="Changing the Electoral College by Party", 
       x="Party", 
       y="% Support",
       fill="Party",
       caption="Source: The Economist/YouGov Poll, <br> Dec. 6-8, 2020, 1500 Adults",
       subtitle = "<br>Percentage of each group who would like to amend <br> the Constitution to elect presidents using the popular vote.<br><br> 
       <span style=color:'blue'>Democrats</span> are more supportive of abolishing<br> the Electoral College than <span style =color:'red'>Republicans</span>.")+
  geom_text(aes(label = paste0(favorable, "%")),
            size = 3, fontface = "bold", vjust=-0.1) +
  theme_minimal()+
  theme(text = element_text(family = "Roboto Mono"),
        panel.grid = element_blank(),
        plot.title = element_text(size = 12,face = "bold", color = "#535657", hjust = 0.5, vjust = -1),
        plot.subtitle = element_markdown(size = 10,face = "bold", color = "#535657", hjust = 0, vjust = -4),
        axis.title.x = element_text(size = 10, face = "bold", color = "#535657", vjust = -2),
        axis.title.y = element_text(size = 10, face = "bold", color = "#535657"),
        axis.text.x = element_text(size = 10, face = "bold", color = "#535657"),
        axis.text.y = element_text(size = 10, face = "bold", color = "#535657"),
        axis.ticks.x = element_line(color = "#b2b2b2"),
        plot.caption = element_markdown(size = 7,face = "bold", color = "#535657", hjust = 1.5, vjust = -1),
        legend.text = element_text(size = 8,face = "bold", color = "#535657"),
        legend.title = element_text(size = 8,face = "bold", color = "#535657"))

  #small change