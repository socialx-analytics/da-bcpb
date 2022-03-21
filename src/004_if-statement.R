
# If Statement ------------------------------------------------------------

# Create a name vevtor
daftar_pelanggan <- c("Andi", "Joko", "Budi")

# Create a input (for Example)
pelanggan <- "Andi"

# Check whether andi is in daftar_pelanggan
if (pelanggan %in% daftar_pelanggan) {
  print(paste(pelanggan, "Ada didalam daftar pelanggan"))
}

# Else Statement ----------------------------------------------------------

if (pelanggan %in% daftar_pelanggan) {
  print(paste(pelanggan, "Tidak ada didalam daftar pelanggan"))
} else {
  print(paste(pelanggan, "Tidak ada didalam daftar pelanggan"))
}

# Else If Statement -------------------------------------------------------

daftar_pelanggan_expire <- c("Agnes", "Mawar")

if (pelanggan %in% daftar_pelanggan) {
  print(paste(pelanggan, "Ada ada didalam daftar pelanggan"))
} else if (pelanggan %in% daftar_pelanggan_churn) {
  print(paste(pelanggan, "Ada ada didalam daftar pelanggan yang sudah berhenti berlangganan"))
} else {
  print(paste(pelanggan, "Tidak ada didalam daftar pelanggan"))
}
