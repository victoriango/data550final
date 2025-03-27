here::i_am(
  "code/00_filter_data.R"
)

library(pacman)
pacman::p_load(readxl, dplyr, here, writexl)

cleaned_data <- read_excel(here::here("data/cleaned_data.xlsx")
)

## Filter the data for South Asia and remove NA outputs from marital_status
filtered_data <- cleaned_data |>
  filter(`UNICEF Region` == "South Asia" & !is.na(marital_status))

# Summarize counts of marital_status per year
summary_data <- filtered_data %>%
  group_by(Year, marital_status) %>%
  summarise(count = n(), .groups = "drop")  # Count observations per group

write_xlsx(summary_data, path = "data/filtered_data.xlsx")