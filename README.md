
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PyInRpkg

<!-- badges: start -->
<!-- badges: end -->

The goal of PyInRpkg is to play with different ways of wrapping python
in an R package to make it feel seamless and also be robust to both
auto-managing python environments and not stomp on preexisting
environments.

## Installation

You can install the development version of PyInRpkg from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("galenholt/py_in_rpkg")
```

I highly recommend doing this into a `renv`-managed R project to sandbox
the testing.

## Background

We want the package to access python functions in modules in
`inst/python`, but not expose a bunch of python objects in the R
session. To do that they’ve been wrapped, which can be done in various
ways (see the files in `R`).

We also want the package to handle pre-existing python environments
(including those in active use in-session), as well as auto-build python
and dependencies, which is handled with some code in `R/zzz.R` and a
`Config/reticulate` entry in the `DESCRIPTION`.

In general, this follows the suggestions in the [reticulate
docs](https://rstudio.github.io/reticulate/articles/python_dependencies.html),
I just wanted to get a better sense of how things worked and test
different configurations.

In-detail stepthroughs of the thinking and testing to figure these
approaches out is at [my
website](https://galenholt.github.io/RpyEnvs/py_in_rpkg.html)

## Use

In a bare R project or one with a `.venv` (and I assume other python
envs) install as above, then run

``` r
library(PyInRpkg)
```

The R wrappers of the python functions are available, but there are no
obvious python objects cluttering up the environment. And in fact, it
has not yet loaded python at all.

As soon as we try to use a function, it will auto-configure python,
ranging from a full install of python if none is available to doing
nothing if python and all dependencies are already present. It does this
whether or not the specific function has dependencies.

``` r
adder_wrap(4,5)
#> [1] 9
```

Functions that depend on packages (e.g. pandas) work too.

``` r
wrap_min(iris, 'Species') 
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width
#> 1          4.3         2.3          1.0         0.1
#> 2          4.9         2.0          3.0         1.0
#> 3          4.9         2.2          4.5         1.4
wrap_mean(iris, 'Species')
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width
#> 1        5.006       3.428        1.462       0.246
#> 2        5.936       2.770        4.260       1.326
#> 3        6.588       2.974        5.552       2.026
```

Note that the *first* time functions are run they can be slow, but are
fast thereafter.
