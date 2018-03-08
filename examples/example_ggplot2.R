# Description: we are going to make some plots with the plants dataset
# Author:
# Date: March 7, 2018

# load the tidyverse
library(tidyverse)

tidyverse_update()

# read the data in
plants <- read_tsv("data/plants.tsv")

# Exploring
str(plants)
glimpse(plants)

# ggplot
ggplot(data = plants, mapping = aes(x = status, fill = status)) +
  geom_bar()

# second plot

ggplot(data = plants,
       mapping = aes(x = gc, y = size_mb, color = subgroup)) +
  geom_point() +
  facet_wrap(~ subgroup)
ggsave("plots/scatterplot_GC_by_size.png")
