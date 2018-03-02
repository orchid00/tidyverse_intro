# Description: Introduction to tidyverse
# Elixir Belgium workshop

# load the package tidyverse
library(tidyverse)

# ------------------------------------------------------------------------------
# Introduction to tidy data

# the turnips example

myturnips <- tibble(
  name = c("eileen", "bart", "kim"),
  day_1 = c(10, 9, 3),
  day_2 = c(11, 10, 15),
  day_3 = c(11, 17, 16)
)
myturnips

turnips_tidy <- gather(
  myturnips,
  `day_1`, `day_2`, `day_3`,
  key = "day",
  value = "turnips"
)
turnips_tidy

turnips_wide <- spread(turnips_tidy, key = "day", value = "turnips")
turnips_wide
# the original dataset
myturnips

# Can you talk about the difference?

# let's do a longer example with the animals

animals <- read_tsv(file = "data/animals.tsv")

glimpse(animals)

# let's gather genes and proteins as one variable
animals2 <-
  animals %>%
  select(subgroup, genes, proteins) %>%
  gather(key = "feature", value = "count", genes, proteins)

glimpse(animals2)
unique(animals2$feature)
# Now we can plot the features count
ggplot(
  data = animals2,
  aes(x = feature, y = count)) +
  geom_boxplot() +
  facet_wrap(~ subgroup, scales = "free_y")

# with a bit more tweaking
animals %>%
  select(subgroup, genes, proteins) %>%
  gather(key = "feature", value = "count", genes, proteins) %>%
  filter(!is.na(count)) %>%
  ggplot(aes(x = feature, y = count)) +
  geom_boxplot(fill = c("ivory")) +
  facet_wrap(~ subgroup, scales = "free_y") +
  theme_minimal()
# Save last plot
ggsave("plots/boxplot_features_subgroup.png")


# Go to scripts/exercises_tidyr.R
