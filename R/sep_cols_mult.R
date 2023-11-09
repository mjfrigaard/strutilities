#' Separate column into multiple columns
#'
#' @param data `data.frame` or `tibble`
#' @param col column to separate
#' @param pattern regular expression pattern passed to `strsplit()`
#' @param col_prefix prefix for new columns
#'
#' @return data.frame with split columns
#'
#' @export
#'
#' @examples
#' d <- data.frame(value = c(29L, 91L, 39L, 28L, 12L),
#'                 name = c("John", "John, Jacob",
#'                          "John, Jacob, Jingleheimer",
#'                          "Jingleheimer, Schmidt",
#'                          "JJJ, Schmidt"))
#' sep_cols_mult(data = d, col = "name", col_prefix = "names")
sep_cols_mult <- function(data, col, pattern = "[^[:alnum:]]+", col_prefix){
  # use regex for pattern, or whatever is provided
  in_rgx <- pattern
  # ensure data is a data.frame
  in_data <- as.data.frame(data)
  # ensure col is a character vector
  in_col <- as.character(col)

  # split columns into a list of vectors
  split_data <- strsplit(in_data[[in_col]], in_rgx)

  # find the maximum number of elements in any split
  max_length <- max(sapply(split_data, length))

  # pad the vectors in the list with NAs to have uniform length
  padded_split_data <- lapply(split_data, function(x) {
    c(x, rep(NA, max_length - length(x)))
  })

  # convert the list of vectors to a matrix
  out_cols <- do.call(rbind, padded_split_data)

  # assign column names
  colnames(out_cols) <- paste(col_prefix, seq_len(max_length), sep = "_")

  # convert to data.frame
  out_cols_df <- as.data.frame(out_cols, stringsAsFactors = FALSE)

  # bind cols together
  out_data <- cbind(in_data, out_cols_df)

  # return the final data frame
  return(out_data)
}
# sep_cols_mult <- function(data, col, pattern = "[^[:alnum:]]+", col_prefix){
#   # use regex for pattern, or whatever is provided
#   in_rgx <- pattern
#   # convert data to data.frame
#   in_data <- as.data.frame(data)
#   # convert col to character vector
#   in_col <- base::as.character(col)
#   # split columns into character matrix
#   out_cols <- stringr::str_split_fixed(in_data[[in_col]],
#                                        pattern = in_rgx,
#                                        n = Inf)
#   # replace NAs in matrix
#   out_cols[base::which(out_cols == "")] <- NA
#   # get number of cols
#   m <- base::dim(out_cols)[2]
#   # assign column names
#   base::colnames(out_cols) <- base::paste(col_prefix, 1:m, sep = "_")
#   # convert to tibble
#   out_cols <- as.data.frame(out_cols)
#   # bind cols together
#   out_tibble <- dplyr::bind_cols(in_data, out_cols)
#   # return the out_tibble
#   return(out_tibble)
# }
