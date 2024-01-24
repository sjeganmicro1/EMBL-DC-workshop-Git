
plt = ggplot(
  data = surveys_complete,
  mapping = aes (x = weight, y = hindfoot_length)
)
plt
str(plt)

plt + 
  geom_point()

plt+
  geom_point() +
  ggtitle("My first plot")
 
plt = ggplot(data = surveys_complete, mapping = aes(X = weight, y = hindfoot_length)) +
  geom_point()

plt +
  ggtitle("weight vs hindfoot length")
install.packages("hexbin")
library(hexbin)

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_hex()

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "blue")

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.25, aes(color = species_id))
     
ggplot (
  data = surveys_complete,
  mapping = aes(
    x = weight,
    y = hindfoot_length,
    color = species_id
  )
) +
  geom_point(alpha = 0.25)
#scatter plot for weight vs species id

ggplot(data = surveys_complete, mapping = aes(x = weight, y = species_id)) +
  geom_point(alpha = 0.25, aes(color = species_id))

ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = weight,
    color = plot_type)
  ) +
  geom_point()

ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = weight)
) +
  geom_boxplot()

ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = weight)
) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(alpha = 0.3, color = "salmon") # adding a little value for each x coordinates

ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = weight)
) + 
  geom_jitter(alpha = 0.3, color = "salmon") +
  geom_boxplot(outlier.shape = NA, fill = NA)

ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = weight)
) +
  geom_violin() +
  scale_y_log10() +
  ylab("Weight (log10)")

#challenge: make. a bok plot + jittered sactterplot of hindfoot_length by speciesid. boxplot should infront of the dots and filled with white

ggplot (
  data = surveys_complete,
  mapping = aes(
    x = weight,
    y = hindfoot_length,
    color = species_id
  )
) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(alpha = 0.3, color = "white")


ggplot(
  data = surveys_complete,
  mapping = aes(
    x = species_id,
    y = hindfoot_length)
)+
  geom_jitter(aes(color = factor(plot_id)))+
                geom_boxplot(outlier.shape = NA)

#count genus with yearlycount

yearly_count = surveys_complete %>%
  count(year, genus)
view(yearly_count)

ggplot(
  data = yearly_count,
  mapping = aes(
    x = year,
    y = n,
    group = genus))+
  geom_line()
  
#adding colour

ggplot(
  data = yearly_count,
  mapping = aes(
    x = year,
    y = n,
    color = genus))+
  geom_line()

yearly_count %>% 
  ggplot(mapping = aes(x= year, y= n, color =genus))+
  geom_line()

surveys_complete %>% 
  count(year, genus) %>% 
  ggplot(mapping = aes(x = year, y = n, color = genus)) +
  geom_line()
yearly_count_graph

ggplot(data = yearly_count, mapping = aes(
  x = year,
  y = n))+
  geom_line() +
  facet_wrap(facets = vars (genus))

#converting the muliple graph
surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_wrap(facets = vars (genus))
#
surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_grid(
    rows = vars (sex),
    cols = vars (genus))

#
surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_grid(
    rows = vars (genus))

#
surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_grid(
    rows = vars (sex))
#
surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_grid(
    cols = vars (genus))


#
plt = surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_wrap(facets = vars(genus))+
  xlab("Year of observation") +
  ylab("NUmber of individuals") +
  ggtitle("Observed genera over time") +
  theme_bw(base_size = 12) +
  theme(
    legend.position = "bottom",
    aspect.ratio = 1,
    axis.text = element_text(angle = 45, hjust = 1.5),
    panel.grid = element_blank()
  )
plt
ggsave(filename = "data/plot.pdf",
       plot = plt,
       width = 20,
       height = 10)

#
plt = surveys_complete %>% 
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x = year,
      y = n,
      color = sex))+
  geom_line() +
  facet_wrap(facets = vars(genus))+
  scale_color_manual(
    values = c("tomato", "dodgerblue"),
    labels = c ("female", "male"),
    name = "Sex")+
  xlab("Year of observation") +
  ylab("NUmber of individuals") +
  ggtitle("Observed genera over time") +
  theme_bw(base_size = 14) +
  theme(
    legend.position = "bottom",
    aspect.ratio = 1,
    axis.text.x = element_text(hjust = 0.5),
    panel.grid = element_blank(),
)
strip.background = element_blank()

##workig script
plt <- surveys_complete %>%
  count(year, genus, sex) %>%
  ggplot(
    mapping = aes(
      x=year,
      y=n,
      color = sex)) +
  geom_line() +
  facet_wrap(facet= vars(genus),
             scales = "free"
  ) +
  scale_color_manual(values = c("tomato", "dodgerblue"),
                     labels = c("female", "male"),
                     name = "Sex") +
  xlab("Years of observation") +
  ylab("Number of individuals") +
  ggtitle("Observed genera over time") +
  theme_bw(base_size = 14) +
  theme(
    legend.position = "bottom", # "none"
    aspect.ratio = 1,
    axis.text.x = element_text(angle = 45,
                               hjust = 1),
    plot.title = element_text(hjust = 0.5),
    panel.grid = element_blank(),
    strip.background =  element_blank()
  )
