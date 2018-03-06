# Description: Introduction to tidyverse
# Exercises tidyr
# Note: The exercises can have multiple solutions, feel free to do it differently
# Note: recommended to start new session for each script (Session , Restart R)

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

## 1. Read in data
## An operational taxonomic unit (OTU)
otutable <- read_tsv("data/otutable.tsv")

## 2. Tidy
otutable_tidy <- otutable %>%
  gather(key = "sample", value = "abundance", contains("Sample"))

## Or
otutable_tidy1 <- otutable %>%
  gather(key = "sample", value = "abundance", starts_with("Sample"))

identical(otutable_tidy, otutable_tidy1)

# you can then remove the otutable_tidy1
rm(otutable_tidy1)

glimpse(otutable_tidy)
head(otutable_tidy)
dim(otutable_tidy)
summary(otutable_tidy$abundance)

## 3. Visualize the distribution of the abundance
ggplot(data = otutable_tidy, aes(x = abundance)) +
  geom_density()

## 4. Relative abundances 
## abundance divided by the sum of abundances per sample
otutable_tidy_rel <- 
  otutable_tidy %>%
  group_by(sample) %>%
  mutate(rel_ab_sample = abundance / sum(abundance)) %>%
  ungroup()

dim(otutable_tidy_rel)
head(otutable_tidy_rel)

## 5. Filter taxa
otutable_filtered <- 
  otutable_tidy_rel %>%
  group_by(taxon) %>%
  mutate(mean_taxon_rel_ab = mean(rel_ab_sample)) %>%
  ungroup() %>%
  filter(mean_taxon_rel_ab >= 0.01) 

dim(otutable_filtered)
head(otutable_filtered)

## 6. Density plot 
ggplot(data = otutable_filtered, aes(x = mean_taxon_rel_ab)) +
  geom_density()

## 7. Tile plot
ggplot(data = otutable_filtered,
  aes(x = sample, y = taxon)) +
  geom_tile(aes(fill = mean_taxon_rel_ab)) 
ggsave("plots/title_sample_taxon_abundance.png",
  width = 7, height = 12
)

## 7. extra
otutable_filtered %>% 
  group_by(taxon) %>% 
  summarise(max_rel_ab = max(mean_taxon_rel_ab)) %>% 
  arrange(desc(max_rel_ab)) %>% 
  top_n(n = 1, wt = max_rel_ab)


  
