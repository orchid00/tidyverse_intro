# Description: Introduction to tidyverse
# Exercises dplyr
# Note: The exercises can have multiple solutions, feel free to do it differently
# Note: recommended to start new session for each script (Session , Restart R)

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

## 1. Import file
mysamples <- read_tsv("data/sampledata.tsv")

## 2. Filter
mysamples_filtered <- 
  mysamples %>%
  select(bmi_group, nationality) %>% 
  filter(!is.na(bmi_group), !is.na(nationality)) 

dim(mysamples_filtered)
head(mysamples_filtered)

## 3 Count
mysamples_summary <- 
  mysamples_filtered %>%
  group_by(nationality, bmi_group) %>%
  summarize(count = n()) %>%
  arrange(nationality, desc(count))

dim(mysamples_summary)
head(mysamples_summary)

## 4. Barpot
ggplot(mysamples_summary, 
       aes(x = nationality, y = count, fill = bmi_group)) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Set3") +
  coord_flip() +
  theme_linedraw()
ggsave("plots/barplot_nationality_bmi.png",
       width = 7, height = 7
)

## 5. Extra filter out European nationalities
mysamples_summary %>% 
  filter(!str_detect(nationality, "Europe"))
