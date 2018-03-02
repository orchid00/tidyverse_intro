# Description: Introduction to tidyverse 
# Elixir Belgium workshop

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
ggplot(data = plants) +
  geom_bar(mapping = aes(x = status, fill = status))

# it is the same as
ggplot(data = plants, mapping = aes(x = status, fill = status)) +
  geom_bar()

## Second plot
ggplot(plants, aes(x = status, y = size_mb)) +
  geom_boxplot()

## Third plot
ggplot(plants, aes(x = gc, y = size_mb)) +
  geom_point()

## Third plot + additional aesthetic
ggplot(plants, aes(x = gc, y = size_mb, color = subgroup)) +
  geom_point()

ggplot(plants, aes(x = gc, y = size_mb, color = subgroup)) +
  geom_point(alpha = 0.3)

## Third plot + additional facet layer
ggplot(plants, aes(x = gc, y = size_mb, color = subgroup)) +
  geom_point() +
  facet_wrap(~subgroup)
# Save last plot
ggsave("plots/scatterplot_GC_by_size.png")

table(plants$subgroup)
