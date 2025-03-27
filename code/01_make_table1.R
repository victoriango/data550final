here::i_am(
  "code/01_make_table1.R"
)

library(readxl)
library(gtsummary)


cleaned_data <- read_excel(here::here("data/cleaned_data.xlsx")
)

#create descriptive summary table
table1summarytable <- tbl_summary(
  cleaned_data,
  by = Sex,  # Grouping variable (e.g., Male/Female)
  include = c(Age, marital_status, urbanicity, "UNICEF Region"),
  label = list(
    marital_status = "Marital Status",
    urbanicity = "Urbanicity",
    "UNICEF Region" = "Region"
  ),
  missing_text = "Missing"
) %>%
  bold_labels() %>%
  add_overall(last = TRUE)  # Places "Overall" column at the end

saveRDS(
  table1summarytable,
  file = "output/table1.rds"
)