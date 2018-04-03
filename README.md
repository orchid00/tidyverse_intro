# Introduction to tidyverse

- Do you have some basic experience using R or other programming language?
- Do you look for an option to help you analyse your data and communicating 
results in a reproducible way?

Then this workshop is for you!

This is a four hour workshop (but you can also play with the exercises at your
own pace). 

## What is tidyverse?

The [tidyverse](https://www.tidyverse.org/) is a collection of R-packages used 
for data manipulation, exploration and visualisation that share a common design philosophy. Tidyverse packages are intended to help you be more productive by guiding you through workflows that facilitate communication, and result in reproducible work products.
If you want to know more about tidyverse check its [website](https://www.tidyverse.org/) and the book [R for Data Science](http://r4ds.had.co.nz/).

## What will be covered in this workshop?

- Introduction to visualisation with ggplot2
- Introduction to data manipulation with dplyr
- Introduction to tidy data with tidyr

## Learning outcome goals

After the workshop you will be able to:
- Describe the difference between tidy and untidy data
- Practice creating tidy datasets and manipulating them using the main tidyr and dplyr verbs
- Integrate data visualisation into your workflow using ggplot2
- Use tidyverse functions to research biological problems (as per exercises)

## Installation
Install the complete tidyverse with:

    install.packages("tidyverse")

## How is this repository structured?

- You can clone or download this repository to your computer.
- We will go trough the material together and allow sufficient time for exercises and questions and solutions.

# How to do use this material for self learning

- If you do this on your own start by opening the slides folder and go through the ppt. 
    - Chapter 1 is an introduction
    - Chapter 2 is about ggplot2 - read the chapter and then follow the demo from examples/demo_ggplot2.R - then do the exercises from scripts/exercises_ggplot2.R
    - Chapter 3 is about dplyr - read the chapter and then follow the demo from examples/demo_dplyr.R - then do the exercises from scripts/exercises_dplyr.R
    - Chapter 4 is about tidyr - read the chapter and then follow the demo from examples/demo_tidyr.R - then do the exercises from scripts/exercises_tidyr.R
    - The last part are examples and useful functions which are good to check for further learning


### Directory layout

A good project layout helps ensure the

- Integrity of data
- Portability of the project
- Easier to pick the project up after a break

This is an RStudio project and I recommend you use RStudio, but you are 
welcome to use any other IDE of your preference. 
- You will work in the `scripts` directory to write your R code
- The `data` directory contains data used in the analysis. 
Important: treat data as read only.
- The `plots` directory contains your plots. 
Important: this directory should only contain generated files. 
Treat any generated output as disposable.


## Attribution

The materials presented here are an updated version of  https://github.com/SWittouck/tidyverse_workshop for the workshop ["Handle your data the tidy way: Data science using R and the tidyverse"](https://bbc2017blog.wordpress.com/workshops/) given at the [Benelux Bioinformatics Conference 2017](https://bbc2017blog.wordpress.com/) by [Sander Wuyts](https://github.com/swuyts) and [Stijn Wittouck](https://github.com/SWittouck). The idea is that the four workshops given in Belgium between Feb and March will have the same format. 

## License

<a rel="license" href="https://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br />These are open education materials for people who want to learn about R and tidyverse. These materials have been prepared by [Paula Andrea Martinez](https://twitter.com/orchid00) and are available under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution 4.0 International License</a>., please see [LICENSE.md](LICENSE.md) for more details.


## Resources

For your own R learning and discovery, here is a personal collection of resources for 
you to use. [R resources](https://github.com/orchid00/R4da/blob/master/resources.md)
