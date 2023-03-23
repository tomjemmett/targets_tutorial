process_data <- function(raw_data) {
  raw_data |>
    summarise(
      across(c("attendances", "breaches"), sum),
      .by = "period"
    ) |>
    mutate(
      performance = 1 - breaches / attendances
    )
}
