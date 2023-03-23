produce_chart <- function(processed_data) {
  ggplot(processed_data, aes(period, performance)) +
    geom_point() +
    geom_line()
}
