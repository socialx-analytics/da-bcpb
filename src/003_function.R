# Case: Calculate area of a circle ----------------------------------------

# Ex. We have 3 radius squared of a circle
r1 <- 12
r2 <- 43
r3 <- 32

# Calculate area of circle

a1 <- 3.14 * (r1)^2
a2 <- 3.14 * (r2)^2
a3 <- 3.14 * (r3)^2

# Function ----------------------------------------------------------------

# Create A function
menghitung_luas_lingkaran <- function(r) {

  # Put the formula
  luas_lingkaran <- 3.14 * (r^2)

  # Return Value
  return(luas_lingkaran)
}

# Use A function
menghitung_luas_lingkaran(r = 30)
