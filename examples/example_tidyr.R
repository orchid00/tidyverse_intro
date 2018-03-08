# example using tidyr

myturnips <- tibble(
  name = c("eileen", "bart", "kim"),
  day_1 = c(10, 9, 3),
  day_2 = c(11, 10, 15),
  day_3 = c(11, 17, 16)
)

myturnips

myturnips_tidy <- gather(myturnips,
                         `day_1`, `day_2`, `day_3`,
                         key = "mydays_of_collection",
                         value = "fruits")

myturnips_tidy

myturnips_wide <- spread(myturnips_tidy,
                         key = "mydays_of_collection",
                         value = "fruits")

myturnips_wide
myturnips

# helper functions
?starts_with
?contains
