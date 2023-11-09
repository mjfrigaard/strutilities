penguins_raw <- read.csv("https://raw.githubusercontent.com/allisonhorst/palmerpenguins/main/inst/extdata/penguins_raw.csv")
saveRDS(object = penguins_raw, file = "tests/testthat/fixtures/test_data.rds")
