#' wrap pandas grouped mean
#'
#' @param df
#' @param group
#'
#' @return
#' @export
#'
#' @examples
wrap_mean <- function(df, group) {
  multipy <- reticulate::import_from_path("multipython",
                                           path = system.file("python",
                                                              package = 'PyInRpkg'),
                                           delay_load = TRUE)
  return(multipy$pdmean(df, group))
}

#' wrap pandas grouped var
#'
#' @param ... df, character group column
#'
#' @return
#' @export
#'
#' @examples
wrap_var <- function(...) {
  multipy <- reticulate::import_from_path("multipython",
                                           path = system.file("python",
                                                              package = 'PyInRpkg'),
                                           delay_load = TRUE)
  return(multipy$pdvar(...))
}

#' wrap pandas column select
#'
#' @param ... df, columns to select as character vector
#'
#' @return
#' @export
#'
#' @examples
wrap_select <- function(...) {
  multipy <- reticulate::import_from_path("multipython",
                                           path = system.file("python",
                                                              package = 'PyInRpkg'),
                                           delay_load = TRUE)
  return(multipy$pdselect(...))
}

#' Wrap python divide
#'
#' @param ... two values
#'
#' @return
#' @export
#'
#' @examples
wrap_divide <- function(...) {
  multipy <- reticulate::import_from_path("multipython",
                                           path = system.file("python",
                                                              package = 'PyInRpkg'),
                                           delay_load = TRUE)
  return(multipy$divide(...))
}

