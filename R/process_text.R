#' Process names and text in dataset
#'
#' @param .data `data.frame`, `tibble`, or `data.table`
#' @param fct convert factors to lowercase? If `TRUE`, factors are returned as
#'     character
#'
#' @return processed dataset
#'
#' @export
#'
#' @examples
#' str(process_text(datasets::CO2))
#' str(process_text(datasets::CO2, fct = TRUE))
process_text <- function(raw_data, fct = FALSE) {
  # convert to data.frame
  raw_data <- as.data.frame(raw_data)
  # clean names (make syntactically valid names in base R)
  nms <- make.names(names(raw_data), unique = TRUE)
  # remove separators
  us_nms <- gsub(pattern = "[^[:alnum:]]+", replacement = "_", x = nms)
  # lowercase
  lc_nms <- make.names(tolower(us_nms), unique = TRUE)
  # remove trailing _
  clean_nmns <- gsub(pattern = "_$", replacement = "", x = lc_nms)
  names(raw_data) <- clean_nmns

  # lowercase (convert all character columns to lowercase)
  lowercase <- raw_data
  char_cols <- sapply(lowercase, is.character)
  lowercase[char_cols] <- lapply(lowercase[char_cols], tolower)

  if (fct) {
    # lowercase (convert all factor columns to lowercase)
    fct_cols <- sapply(lowercase, is.factor)
    lowercase[fct_cols] <- lapply(lowercase[fct_cols], tolower)
  }


  # remove carriage return (replace all carriage returns with space in character columns)
  processed <- lowercase
  processed[char_cols] <- lapply(processed[char_cols], function(column) {
    gsub(pattern = "\\r|\\r\\n|\\n", replacement = " ", x = column)
  })

  return(processed)
}
