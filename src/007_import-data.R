
# Import Data -------------------------------------------------------------

# Import Data From Google Spreadsheet (Package: googlesheet4)
library(googlesheet4)
billing_terbit_gs <- read_sheet("https://docs.google.com/spreadsheets/d/1_S_LxJqG_o_m2baNtQN2CBfg43AJvtck7KTGjKwb4dM/edit?usp=sharing")

# Import Excel Data (Package: readxl)
library(readxl)
billing_terbit_excel <- read_xlsx("data/billing_terbit_sample.xlsx")

# Import CSV Data (Package: readr)
library(readr)
billing_terbit_csv <- read_csv("data/billing_terbit_sample.csv")

# Please try to import data pembetulan

# Import Data from Database -----------------------------------------------

# Load Packages
library(DBI)

# Create Connection
con <- dbConnect(RPostgres::Postgres(),
  host = "ls-bba60de9fcd85ca4b7b98d82ff9fa05805dbc27d.cdz63ohdpvzq.ap-southeast-1.rds.amazonaws.com",
  dbname = "bea-cukai",
  port = 5432,
  user = "dbmasteruser",
  password = "O8Cl9L%J_m5L+AqcUBECI<N:yfu{`*VY"
)

# Check list of tables
dbListTables(con)

# Import Tables
billing_terbit_database <- dbReadTable(con, "billing_terbit")

# Add/write table pembetulan to database
