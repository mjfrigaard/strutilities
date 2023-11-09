describe("Feature: Parsing terms
            As a data scientist
            I want to convert strings into tibbles with unique elements
            So that I can count and analyze the terms",
  code = {
    it("Scenario: Parsing a set of string terms
         Given a vector of multiple strings
         When pivot_term_long() is applied
         Then a 2-column data.frame will be returned
         And [unique_terms] will contain each distinct word from the term
         And [term] will contain the original term",
      code = {
        test_logger(start = "pivot_term_long()", msg = "multiple terms")

        expected <- data.frame(
          unique_items = c(
            "A", "large", "size", "in", "stockings",
            "is", "hard", "to", "sell", "The", "first",
            "part", "of", "the", "plan", "needs", "changing"
          ),
          term = c(
            "A large size in stockings is hard to sell.",
            NA, NA, NA, NA, NA, NA, NA, NA,
            "The first part of the plan needs changing.",
            NA, NA, NA, NA, NA, NA, NA
          )
        )
        terms <- c(
          "A large size in stockings is hard to sell.",
          "The first part of the plan needs changing."
        )
        expect_equal(object = pivot_term_long(terms), expected = expected)
        test_logger(end = "pivot_term_long()", msg = "multiple terms")
      }
    )
  }
)
