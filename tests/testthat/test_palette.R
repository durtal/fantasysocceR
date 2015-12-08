library(fantasysocceR)
context("palettes")

test_that("palette is a character", {
    expect_is(team_pal(), "character")
})
