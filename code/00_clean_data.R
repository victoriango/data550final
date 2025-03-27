here::i_am(
  "code/00_clean_data.R"
)

library(pacman)
pacman::p_load(readxl, dplyr, here, writexl)


#load in data
Adolescent_HIV <- read_excel(here::here("data/Adolescent_HIV_550.xlsx"))

#data cleaning
cleaned_data <- Adolescent_HIV |>
  #create combined label for clarity
  mutate(DISAGG = case_when( 
    DISAGG %in% c("Ever married", "has ever been in union") ~ "Ever married or in union",
    TRUE ~ DISAGG
  )) |>
  
  #create new marital status variable from DISAGG variable outputs
  mutate(
    marital_status = case_when( 
      DISAGG %in% c("Ever married or in union", "Married or living together", "Never married", "Never married, ever had sex", "Never married, never had sex", "Widowed, divorced, separated") ~ DISAGG,
      TRUE ~ NA_character_
    )) |>
  
  #create new urbanicity variable from DISAGG variable outputs
  mutate(
    urbanicity = case_when(
      DISAGG %in% c("Urban", "Rural") ~ DISAGG,
      TRUE ~ NA_character_
    )) |>
  
  #filter out where sex is not equal to "both". only keeps "male" or "female" for binary results
  filter(Sex != "both"
  )

write_xlsx(cleaned_data, path = "data/cleaned_data.xlsx")
