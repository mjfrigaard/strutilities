#' Pivot a term (sentence) into a data.frame (long)
#'
#' @param term string, term, sentence, etc.
#'
#' @return data.frame with `Unique Items` and `Term`
#'
#' @export
#'
#' @examples
#' pivot_term_long("A large size in stockings is hard to sell.")
pivot_term_long <- function(term) {
    # split to remove commas and convert to vector
    term_items <- strsplit(term, ",")[[1]]
    # remove whitespace (both)
    term_items <- trimws(term_items)

    # unique term
    # get individual terms
    unique_terms <- unlist(strsplit(term, " "))
    # remove commas
    unique_terms <- gsub(",", "", unique_terms)
    # get unique
    unique_terms <- unique(unique_terms)

    # create data frame from terms
    max_length <- max(length(unique_terms), length(term_items))
    unique_terms <- unique_terms[seq_len(max_length)]
    term_items <- term_items[seq_len(max_length)]
    terms_data_frame <- data.frame(
        `Unique Items` = unique_terms,
        `Term` = term_items,
        stringsAsFactors = FALSE
    )

    return(terms_data_frame)
}
