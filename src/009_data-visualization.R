
# Import Data -------------------------------------------------------------

# Import Billing Terbit Data
billing_terbit <- read_xlsx("data/billing_terbit_sample.xlsx")

# Load Packages -----------------------------------------------------------

library(ggplot2)

# Bar Plot
bar_plot <- billing_terbit %>%
  ggplot(aes(x = dokumen)) +
  geom_bar()
bar_plot

# Bar Plot: Change Color
bar_plot_c <- billing_terbit %>%
  ggplot(aes(x = dokumen, fill = dokumen)) +
  geom_bar()
bar_plot_c

# Pie Plot
pie_plot <- billing_terbit %>%
  ggplot(aes(x = dokumen, fill = dokumen)) +
  geom_bar() +
  coord_polar()
pie_plot

# Line Plot
line_plot <- billing_terbit %>%
  group_by(tgl_billing) %>%
  summarise(total_pungutan = sum(total_pungutan)) %>%
  ggplot(aes(x = tgl_billing, y = total_pungutan)) +
  geom_line(color = "steelblue")
line_plot

# Adding Title, Subtitle, Theme
line_plot_t <- billing_terbit %>%
  group_by(tgl_billing) %>%
  summarise(total_pungutan = sum(total_pungutan)) %>%
  ggplot(aes(x = tgl_billing, y = total_pungutan)) +
  geom_line(color = "steelblue") +
  labs(
    title = "Trend Pungutan: Bea Cukai Pasar Baru",
    subtitle = "Februari 2022",
    x = "Total Pungutan",
    y = "Tanggal Billing"
  ) +
  theme_minimal()
line_plot_t


# Interactive Visualization: Plotly ---------------------------------------

# Load Packages
library(plotly)

# Create interactive visualization
ggplotly(line_plot_t)

# Fix Scientific Notation
options(scipen = 10000)

# Run Again
