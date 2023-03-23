build_model <- function(processed_data) {
  lm(performance ~ period, processed_data)
}
