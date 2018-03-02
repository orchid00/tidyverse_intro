# Description: Introduction to tidyverse
#              Exercises tidyr
# Date: 
# Author:
# Note: - The exercises can have multiple solutions.
#       - It is recommended to start new session for each script 
#       (Session > New Session)

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

## 1. Import the file otutable.tsv as a tibble. 


## 2. Tidy the tibble. 
## Hint: results in a tibble with three columns: taxon, sample, abundance. 
## resulting dimensions: 152360x3


## 3. Visualise the distribution of abundance using a density plot.


## 4. Add a fourth column with relative abundances within a sample. 
## Call it “rel_ab_sample. 
## Hint: abundance divided by the sum of abundances per sample.


## 5. Filter the tibble so that only taxa with a mean relative abundance of at 
## least 1% are retained.
## Important: this is not the same as filtering out rows with rel_abundance < 1%.
## Hint: first try to make a column “mean_taxon_rel_ab”. 
## Resulting dimensions: 30472x5


## 6. Visualise the distribution of mean_taxon_rel_ab using a density plot.


## 7. Make a tile plot to visualise mean_taxon_rel_ab. 
## Put the sample on the x-axis and taxon on the y-axis. 
## Extra: Which taxa is the one with higher value of mean_taxon_rel_ab?


# You have done a great job!
# If you are waiting for others to finish, please fill the feedback form
# https://tiny.cc/elixir_feedback