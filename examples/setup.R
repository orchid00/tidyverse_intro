# Description: This is a short example of munging data to obtain the dataset
# animals and plants to use in the tutorial
# Date: Feb 28, 2018
# Note: The table gets updated, so results might be different if you 
# download the dataset another date

# load the package tidyverse ---------------------------------------------------
library(tidyverse)

# create folders for the analysis
if (!dir.exists("scripts")) dir.create("scripts")
if (!dir.exists("plots")) dir.create("plots")
if (!dir.exists("data")) dir.create("data")

# We are going to work with a public dataset from NCBI about genome reports
# download data 
download.file(url = "ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/eukaryotes.txt",
              destfile = "data/2018-03-01_ekaryote_genomes.txt")
# 1.3 MB size of the file

# read data
eukaryotes <- read_tsv(
  file = "data/2018-03-01_ekaryote_genomes.txt", na = c("-", "NA"),
  quoted_na = FALSE
)

# You will notice that some names have spaces and other avoidable characters
# Let's format the names in the header

names_new <- names(eukaryotes) %>%
  str_replace_all("[#%()]", "") %>%
  str_replace_all("[ /]", "_") %>%
  str_to_lower()

names_new

# Reassigning the names_new
names(eukaryotes) <- names_new

# We are only interested in a subset of the data set that refers to the 
# Animals group

animals <- eukaryotes %>%
  filter(group == "Animals") 

glimpse(animals)
# dimensions: 1312 x 19

# We can do the same for the Plants
plants <- eukaryotes %>%
  filter(group == "Plants") 

glimpse(plants)
# dimensions: 520 x 19

# Save the animals! and the plants!
if (!file.exists("data/animals.tsv"))
  write_tsv(animals, "data/animals.tsv")
if (!file.exists("data/plants.tsv"))
  write_tsv(plants, "data/plants.tsv")



# recommended to delete the objects created
rm(eukaryotes, names_new, animals, plants )
