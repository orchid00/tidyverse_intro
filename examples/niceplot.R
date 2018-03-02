# Description: Introduction to tidyverse
# Elixir Belgium workshop
# Example
# Note: recommended to start new session for each script (Session > New Session)

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

## 1. Read in data
## An operational taxonomic unit (OTU)
animals <- read_tsv("data/animals.tsv")
# Another tweaking example

## Scatterplot from 2
animals %>% 
  select(subgroup, gc, size_mb) %>% 
  filter(!is.na(gc), !is.na(size_mb)) %>% 
  ggplot(aes(x = gc, y = size_mb, color = subgroup)) +
  geom_point() +
  facet_wrap(~subgroup) +
  xlab("GC-content (%)") +
  ylab("Genome size (Mb)") +
  ggtitle("NCBI Eukaryotic Animal Genomes") +
  scale_y_log10() +
  scale_colour_brewer(palette = "Paired") +
  theme_linedraw() +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    axis.title = element_text(size = 12),
    plot.title = element_text(size = 16, face = "italic", colour = "darkgrey"),
    panel.grid.minor = element_blank()
  )
ggsave("plots/point_gc_size.png",
       width = 10, height = 8
)
