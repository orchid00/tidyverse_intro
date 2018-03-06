# Description: Introduction to tidyverse 

# load the package tidyverse
library(tidyverse)

# It is suggested that you update your packages regularly
# If you want to do so, please uncomment the following line
# tidyverse_update()
# You will get this message: All tidyverse packages up-to-date

# ------------------------------------------------------------------------------
# Introduction to dplyr

# Here I am using dim to see the transformation in the dataset
## Read in data
animals <- read_tsv("data/animals.tsv")

## Explore dataset
glimpse(animals)
dim(animals)
# [1] 1312   19

## select
(animals2 <- select(animals, organism_name, subgroup, size_mb))
dim(animals2)
# [1] 1312    3

## mutate
animals2 <- mutate(animals, size_kb = size_mb * 1000)
dim(animals2)
# [1] 1312   20
names(animals2)

## filter
animals2 <- filter(animals, subgroup == "Mammals")
dim(animals2)

## arrange
animals2 <- arrange(animals, desc(size_mb))
dim(animals2)
#[1] 1312   19
head(animals2, n = 1)
# Ambystoma mexi… is the largest organism in the dataset
tail(animals2, n = 1)

# Here we show that the genome sizes are not normally distributed
ggplot(animals, 
       mapping = aes(x = size_mb)) +
  geom_density()

# It is a skewed distribution

## summarise 
summarise(animals, n = n(), mean_genome_size = mean(size_mb, na.rm = TRUE))

## group-wise summarise
## Let's check which center provided us with more genome sequences
## We will only use center
animals2 <- select(animals, center)
# then group by center
animals2 <- group_by(animals2, center)
# we don't see any change but we can check the groups
groups(animals2)
# now summarise
animals2 <- summarise(animals2,
                   count_genomes = n())
# after summarise no need to worry about ungroup
animals2 <- arrange(animals2, desc(count_genomes))
head(animals2, n = 15)
dim(animals2)
# mutate will add a column to the end
glimpse(animals2)

## The pipe operator!!!
## group-wise mutate
animals3 <- 
  animals %>% 
  select(organism_name, size_mb) %>% 
  group_by(organism_name) %>% 
  mutate(n = n(), mean_genome_size = mean(size_mb)) %>% 
  arrange(organism_name, desc(mean_genome_size)) %>% 
  ungroup()

animals3
tail(animals3)
dim(animals3)

## group-wise summarise
animals4 <- animals %>%
  select(subgroup, size_mb) %>% 
  filter(!is.na(subgroup)) %>%
  group_by(subgroup) %>%
  summarise(n = n(), mean_genome_size = mean(size_mb)) %>%
  arrange(desc(mean_genome_size))

animals4
dim(animals4)

# Go to scripts/exercises_dplyr.R
