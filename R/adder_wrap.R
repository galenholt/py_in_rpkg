#' Wrapped python including import
#' This imports a python module internally, uses it, and returns the output
#'
#' @param x number
#' @param y number
#'
#' @return number
#' @export
#'
#' @examples
#' adder_wrap(2,3)
adder_wrap <- function(x,y) {
  adder <- reticulate::import_from_path("adder",
                                        path = system.file("python",
                                                           package = 'PyInRpkg'),
                                        delay_load = TRUE)
  adder$adder(x,y)
}
