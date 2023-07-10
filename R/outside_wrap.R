multi2 <- reticulate::import_from_path("multi2",
                                       path = system.file("python",
                                                          package = 'PyInRpkg'),
                                       delay_load = TRUE)

#' Wrap pandas group sd
#'
#' @param df
#' @param group
#'
#' @return
#' @export
#'
#' @examples
wrap_min <- function(df, group) {
  return(multi2$pdmin(df, group))
}

#' Wrap pandas group sum
#'
#' @param df
#' @param group
#'
#' @return
#' @export
#'
#' @examples
wrap_sum <- function(df, group) {
  return(multi2$pdsum(df, group))
}

#' wrap python subtraction
#'
#' @param df
#' @param group
#'
#' @return
#' @export
#'
#' @examples
wrap_minus <- function(df, group) {
  return(multi2$minus(df, group))
}
