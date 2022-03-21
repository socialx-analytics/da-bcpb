# Data Type ---------------------------------------------------------------

# Declare Variable
var_numeric <- 1
var_integer <- 1L
var_character <- "1"

# Check Data type
typeof(var_character)

# So what? You might get an error if .....
var_new <- var_character + var_integer

# Other Data Type
var_logical <- TRUE

# Please check the type of it

# How About Date?
date <- as.Date("26-04-1998")

# Data Structure ----------------------------------------------------------

# How to store multiple value at 1 variable?

# Vector (Only one data type) use "c()"
ex_vector <- c(1, 2, 3)
age <- c(23, 24, 26, 34, 21)

# List (Multiple data types) use "list()"
ex_list <- list(1, "2", TRUE)

# Table? use Dataframe, put some vector on in
ex_dataframe <- data.frame(
  nama = c("Dito", "Pute", "Rosidi"),
  usia = c(23, 24, 27)
)

# Get mean of age
mean(age)

# Get mean of usia in dataframe
mean(ex_dataframe$usia)

# Get mean of usia in dataframe (Another Way)
mean(ex_dataframe[["usia"]])
