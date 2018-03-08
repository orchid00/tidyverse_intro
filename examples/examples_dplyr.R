# Description: Playing with the animals dataset and dplyr

# Load the tidyverse
library(tidyverse)

# Read in the data
animals <- read_tsv("data/animals.tsv")

# explore the date set
glimpse(animals)

# Select
animals2 <- select(animals, organism_name, status)
glimpse(animals2)
head(animals2)

# Mutate
animals2 <- mutate(animals, size_kb = size_mb * 1000)
head(animals2)
glimpse(animals2)

# filter
summary(animals$size_mb)


animals2 <- filter(animals, size_mb > 30000)
animals2

# arrange
animals2 <- arrange(animals, desc(size_mb))
head(animals2)
tail(animals2)

# Grouping summary
animals3 <- animals %>% 
            select(subgroup, organism_name, size_mb) %>% 
            group_by(subgroup ) %>% 
            mutate(mean_size = mean(size_mb)) %>% 
            ungroup() %>% 
            arrange(subgroup, desc(size_mb))

head(animals3)

## group-wise summarise
animals4 <- animals %>%
  select(subgroup, size_mb) %>% 
  filter(!is.na(subgroup)) %>%
  group_by(subgroup) %>%
  summarise(counts_persubgroup = n(), mean_genome_size = mean(size_mb)) %>%
  arrange(desc(mean_genome_size))

animals4
dim(animals4)

animals5 <- animals %>%
  select(subgroup, organism_name, size_mb) %>% 
  filter(!is.na(subgroup)) %>%
  group_by(subgroup, organism_name) %>%
  summarise(max_genome_size = max(size_mb)) %>% 
  filter(max_genome_size == max(max_genome_size)) %>% 
  arrange(desc(max_genome_size), subgroup)

animals5


  

