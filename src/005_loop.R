# For Loop ----------------------------------------------------------------

# Define 3 radius squared of a circle
r <- c(12, 43, 32)

# Loop trough all r
for (i in r) {
  print(3.14 * (i)^2)
}

# While Loop --------------------------------------------------------------

# Set number of r
stock <- 10

# While loop
while (stock > 0) {
  print(paste0("Jumlah stock = ", stock))
  stock <- stock - 1
}
