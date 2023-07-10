#' simple wrapper of a pandas summarise
#'
#' @param df a dataframe
#' @param group character, grouping column
#'
#' @return
#' @export
#'
#' @examples
pdsummary_wrap <- function(df, group) {
  pdsummary <- reticulate::import_from_path("pdsummary",
                                        path = system.file("python",
                                                           package = 'PyInRpkg'),
                                        delay_load = TRUE)
  pdsummary$pdsummary(df, group)
}
