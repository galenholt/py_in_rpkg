test_that("wrap_mean works", {
  expect_equal(
    wrap_mean(iris,'Species')[1,1], 5.006)
})

test_that("wrap_divide works", {
  expect_equal(
    wrap_divide(1,2), 0.5)
})
