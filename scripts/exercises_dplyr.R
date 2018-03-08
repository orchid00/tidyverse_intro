# Description: Introduction to tidyverse
#              Exercises dplyr
# Date: 
# Author:
# Note: - The exercises can have multiple solutions.
#       - It is recommended to start new session for each script 
#       (Session , Restart R)

# If you haven't installed tidyverse, please uncomment the following line
# install.packages("tidyverse")

# load the package tidyverse
library(tidyverse)

## 1. Import the file sampledata.tsv.


## 2. Select nationality and bmi_group and filter out all rows where 
## the variables nationality or bmi_group are NA. Store the resulting 
## tibble as “mysamples_filtered”. Hint: resulting dimensions: 1057x2


## 3. Start from “mysamples_filtered”. Make a tibble "mysamples_summary" 
## with a count of participants per combination of nationality and bmi_group.
## Sort the table by nationality and inversely by count within each nationality.
## Hint: resulting dimensions: 27x3


## 4. Make a bar plot to inspect whether some nationalities have more overweight
## participants than others, using mysamples_summary. 
## Extra: Flip the axis and use a palette colour called “Set3”, change the 
## default theme. Save the plot in plots


## 5. Extra: use mysamples_summary and filter out the nationalities with 
## "Europe" in the name. Hint: resulting dimensions 15 x 3


## Keep up the hard work!! 