describe(
"Feature: Process text from dataset
    As a data scientist
    I want to quickly standardize text and columns in a dataset
    So that I can predictably analyze the data", code = {
  test_that(
   "Scenario: scenario
     Given a raw data
     When I apply process_text()
     Then the output dataset should have snake case columns
     And the output dataset should have lowercase text", code = {
   test_logger(start = "process_text()", msg = "names penguins_raw.csv")
    test_data <- readRDS(test_path("fixtures", "test_data.rds"))
    processed_data <- process_text(raw_data = test_data, fct = TRUE)
    nms <- c("studyname",
            "sample_number",
            "species",
            "region",
            "island",
            "stage",
            "individual_id",
            "clutch_completion",
            "date_egg",
            "culmen_length_mm",
            "culmen_depth_mm",
            "flipper_length_mm",
            "body_mass_g",
            "sex",
            "delta_15_n_o_oo",
            "delta_13_c_o_oo",
            "comments")
    expect_equal(object = names(processed_data), expected = nms)
    test_logger(end = "process_text()", msg = "names penguins_raw.csv")
  })
})

# describe(
# "Feature: Process text from dataset
#     As a data scientist
#     I want to quickly standardize text and columns in a dataset
#     So that I can predictably analyze the data", code = {
#   test_that(
#    "Scenario: scenario
#      Given a raw data
#      When I apply process_text()
#      Then the output dataset should have snake case columns
#      And the output dataset should have lowercase text", code = {
#    test_logger(start = "process_text()", msg = "names palmerpenguins::penguins_raw")
#     test_data <- palmerpenguins::penguins_raw
#     processed_data <- process_text(raw_data = test_data, fct = TRUE)
#     nms <- c("studyname",
#             "sample_number",
#             "species",
#             "region",
#             "island",
#             "stage",
#             "individual_id",
#             "clutch_completion",
#             "date_egg",
#             "culmen_length_mm",
#             "culmen_depth_mm",
#             "flipper_length_mm",
#             "body_mass_g",
#             "sex",
#             "delta_15_n_o_oo",
#             "delta_13_c_o_oo",
#             "comments")
#     expect_equal(object = names(processed_data), expected = nms)
#     test_logger(end = "process_text()", msg = "names palmerpenguins::penguins_raw")
#   })
# })
