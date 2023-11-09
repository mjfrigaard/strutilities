#' Pivot a term (sentence) into a data.frame (long)
#'
#' @param term string, term, sentence, etc.
#' @param sep separator pattern (set to `"[^[:alnum:]]+"`)
#'
#' @return data.frame with `unique_items` and `term`
#'
#' @export
#'
#' @examples
#' pivot_term_long("A large size in stockings is hard to sell.")
#' pivot_term_long(c("A large size in stockings is hard to sell.", "The first part of the plan needs changing." ))
pivot_term_long <- function(term, sep = "[^[:alnum:]]+") {

  pivot_term <- function(term, sep) {
      term_items <- unlist(strsplit(term, sep))
      term_col <- c(term, rep(NA_character_, times = length(term_items) - 1))
      data.frame(unique_items = term_items, term = term_col)
  }

  if (length(term) > 1) {
    do.call(rbind, lapply(term, pivot_term, sep = sep))
  } else {
    pivot_term(term = term, sep = sep)
  }

}

