# manage the python environment, even if already running
.onLoad <- function(libname, pkgname) {
  reticulate::configure_environment(pkgname)
}

# .onLoad is not needed if the `import` happens in an R wrapper function, whether or not there are dependencies
  # Is this true in a bare install of the package (e.g. without a preexisting py env)?

# No dependencies, not wrapped --------------------------------------------
# This puts the module in the outer environment, so no need to wrap
# .onLoad <- function(libname, pkgname) {
#   adder <<- reticulate::import_from_path("adder",
#                                          path = system.file("python",
#                                                             package = 'PyInRpkg'),
#                                          delay_load = TRUE)
# }


# Dependencies, not wrapped -----------------------------------------------

# .onLoad <- function(libname, pkgname) {
#   pdsummary <<- reticulate::import_from_path("pdsummary",
#                                          path = system.file("python",
#                                                             package = 'PyInRpkg'),
#                                          delay_load = TRUE)
# }


# Several functions in one module, unwrapped ------------------------------

# .onLoad <- function(libname, pkgname) {
#   multipy <<- reticulate::import_from_path("multipython",
#                                          path = system.file("python",
#                                                             package = 'PyInRpkg'),
#                                          delay_load = TRUE)
# }

