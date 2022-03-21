# Data Exploration: dplyr -------------------------------------------------

# Load Packages
library(readxl)
library(dplyr)

# Please import your data first
billing_terbit <- read_xlsx("data/billing_terbit_sample.xlsx")

# Glimpse: Help you understand your data
glimpse(billing_terbit)

# Select: Select or deselect colum
ex_select <- select(
  billing_terbit,
  kode_billing,
  tgl_billing
)

# Filter: Filter based on certain condition
ex_filter <- filter(
  billing_terbit,
  dokumen == 17
)


# Mutate: Modify or create a new column
ex_mutate <- mutate(billing_terbit,
  jeda = as.numeric((tgl_bayar - tgl_billing) / 60 / 60 / 24)
)

# Rename
ex_rename <- rename(billing_terbit,
  tanggal_bay = tgl_bayar
)

# Summaries
ex_summaries <- summarise(billing_terbit,
  mean = mean(total_pungutan)
)

# Arrange
ex_arrange <- arrange(billing_terbit, total_pungutan)

# Pipe
ex_pipe <- billing_terbit %>%
  filter(dokumen == 17) %>%
  summarise(total_pungutan = sum(total_pungutan))

# Group by
ex_groupby <- billing_terbit %>%
  group_by(dokumen) %>%
  summarise(total_pungutan = sum(total_pungutan))
