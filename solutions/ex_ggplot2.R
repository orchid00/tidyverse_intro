# Description: Introduction to tidyverse
# Exercises ggplot2
# Note: The exercises can have multiple solutions, feel free to do it differently
# Note: recommended to start new session for each script (Session , Restart R)

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

## 1. Read in data
sampledata <- read_tsv("data/sampledata.tsv")

## 2. Explore the dataset
dim(sampledata)
# [1] 1172    9
glimpse(sampledata)

## 3. Plot the amount of males and females in this study using a bar plot
ggplot(data = sampledata, mapping = aes(x = gender)) +
  geom_bar()
ggsave("plots/barplot_gender.png")

## 4. Do the same but show the nationality and flip the axes
ggplot(sampledata, aes(x = nationality)) +
  geom_bar() +
  coord_flip()
ggsave("plots/barplot_flip_nationality.png")

## 5. Create a boxplot showing the age distribution for each nationality.
## Use the fill aesthetic to make it a little bit more colorful
ggplot(sampledata, aes(x = nationality, y = age, fill = nationality)) +
  geom_boxplot()
ggsave("plots/boxplot_age_by_nationality.png")

## 6. Add an extra layer to 5. with plotting points over the boxplot.
ggplot(sampledata, aes(x = nationality, y = age, fill = nationality)) +
  geom_boxplot() +
  geom_point()
## Remove that layer again and explore the difference with geom_jitter()
ggplot(sampledata, aes(x = nationality, y = age, fill = nationality)) +
  geom_boxplot() +
  geom_jitter()

# Or
ggplot(data = sampledata, mapping = aes(x = nationality, y = age)) +
  geom_boxplot(fill = "chocolate4") +
  geom_jitter(colour = "chocolate1") +
  theme_light()
ggsave("plots/boxplot_jitter_age_by_nationality.png")

## 7. Advanced: Plot the age density of all participants coloured by gender,
## faceted by nationality.

ggplot(sampledata, aes(x = age, fill = gender)) +
  geom_density() +
  facet_wrap(~nationality)

## Or
ggplot(sampledata, aes(x = age, fill = gender)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~nationality, nrow = 7) +
  geom_rug() +
  theme_bw()
ggsave("plots/density_age_nationality.png",
  width = 7, height = 10
)

# Recommended to start a new session