here::i_am(
  "code/02_make_figure1.R"
)

library(pacman)
pacman::p_load(readxl, dplyr, here, writexl, ggplot2)

filtered_data <- read_excel(here::here("data/filtered_data.xlsx")
)

# Create the bar chart
line_plot <- ggplot(filtered_data, aes(x = Year, y = count, color = marital_status, group = marital_status)) +
  geom_line(linewidth = 1) +
  geom_point(size = 1) +
  # Force x-axis breaks every 4 years
  scale_x_continuous(
    breaks = seq(
      from = min(filtered_data$Year, na.rm = TRUE), 
      to = max(filtered_data$Year, na.rm = TRUE), 
      by = 4
    )
  ) +
  labs(
    title = "Marital Status Collection Trends in South Asia (2006–2022)",
    x = "Year",
    y = "Count",
    color = "Marital Status"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  plot = line_plot,
  device = "png",
  file = "output/figure1.png"
)