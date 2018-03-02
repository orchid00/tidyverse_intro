# Description: Introduction to tidyverse 
# Elixir Belgium workshop

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

# It is skewed distribution

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
# after summarize no need to worry about ungroup
animals2 <- arrange(animals2, desc(count_genomes))
head(animals2, n = 15)
dim(animals2)
# mutate will add a column to the end
glimpse(animals2)

## group-wise mutate
animals3 <- select(animals, organism_name, size_mb)
animals3 <- group_by(animals3, organism_name)
animals3 <- mutate(animals3, n = n(), mean_genome_size = mean(size_mb))
# now we can also use arrange
animals3 <- arrange(animals3, organism_name, desc(mean_genome_size))
animals3 <- ungroup(animals3)
animals3
tail(animals3)
dim(animals3)


## The pipe operator!!!
animals4 <- animals %>%
  select(subgroup, size_mb) %>% 
  filter(!is.na(subgroup)) %>%
  group_by(subgroup) %>%
  summarize(n = n(), mean_genome_size = mean(size_mb)) %>%
  arrange(desc(mean_genome_size))

animals4
dim(animals4)

# restart a new session