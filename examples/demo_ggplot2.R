# Description: Introduction to tidyverse 

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

# It is suggested that you update your packages regularly
# If you want to do so, please uncomment the following line
# tidyverse_update()
# You will get this message: All tidyverse packages up-to-date

# ------------------------------------------------------------------------------
# Introduction to ggplot2

## Read in data
plants <- read_tsv("data/plants.tsv")

## Explore dataset
glimpse(plants)

## First plot
ggplot(data = plants, mapping = aes(x = status, y = size_mb)) +
  geom_boxplot() +
  scale_y_log10()

## Second plot
ggplot(plants, aes(x = genes, y = gc)) +
  geom_point() +
  geom_smooth(colour = "gold")

## Third plot
ggplot(plants, aes(x = size_mb, fill = subgroup , colour = subgroup)) +
  geom_histogram(alpha = 0.3, bins = 50)

## Third plot + additional facet layer
ggplot(plants, aes(x = size_mb, fill = subgroup , colour = subgroup)) +
  geom_histogram(alpha = 0.3, bins = 50) +
  facet_wrap(~ subgroup)
# Save last plot
ggsave("plots/scatterplot_GC_by_size.png")

table(plants$subgroup)

# Go to scripts/exercises_ggplot2.R
