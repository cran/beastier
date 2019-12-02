## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_beastier, results='hide', warning=FALSE, error=FALSE, message=FALSE----
library(beastier)

## ----load_testthat------------------------------------------------------------
library(testthat)

## -----------------------------------------------------------------------------
beast2_options <- create_beast2_options(
  input_filename = get_beastier_path("2_4.xml")
)
names(beast2_options)

## -----------------------------------------------------------------------------
expect_true(file.exists(beast2_options$input_filename))
expect_false(file.exists(beast2_options$output_state_filename))

## -----------------------------------------------------------------------------
if (is_beast2_installed()) {
  output <- run_beast2_from_options(beast2_options)
}

## -----------------------------------------------------------------------------
if (is_beast2_installed()) {
  expect_true(file.exists(beast2_options$output_state_filename))
}

## -----------------------------------------------------------------------------
if (is_beast2_installed()) {
  print(output)
}

