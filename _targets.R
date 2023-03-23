# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)

# Set target options:
tar_option_set(
  packages = c("tibble", "dplyr", "ggplot2"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

options(clustermq.scheduler = "multiprocess")

tar_source()

list(
  tar_target(raw_data, get_data()),
  tar_target(processed_data, process_data(raw_data)),
  tar_target(chart, produce_chart(processed_data)),
  tar_target(model, build_model(processed_data)),
  tar_target(report, generate_report(chart, model))
)
