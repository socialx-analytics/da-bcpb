
# Package -----------------------------------------------------------------

# Read Data From Google Spreadsheet
billing_terbit <- read_sheet("https://docs.google.com/spreadsheets/d/1_S_LxJqG_o_m2baNtQN2CBfg43AJvtck7KTGjKwb4dM/edit?usp=sharing")

# Yes, Its Error, Because you need a package to do that

# Install  Package
install.packages("googlesheets4")

# Load Package
library("googlesheets4")

# Try to run the code again
# Suggestion: Don't put install package on your code
# Suggestion: Put load pakcage in the top of your code
