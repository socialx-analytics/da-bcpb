
# Load Packages and Import Data -------------------------------------------

# Load packages
library(tidyverse)
library(cluster)
library(factoextra)

# Import Data
df <- read_csv("data/ml/customer-churn.csv")

# Show first 5 row
head(df)

# Check Data
glimpse(df)

# Visualize Data
df %>%
  ggplot(aes(x = tenure, y = MonthlyCharges)) +
  geom_point()

# Data Pre-processing ------------------------------------------------------

# Select Data, sample, and standardize
df_cluster <- df %>%
  sample_n(300) %>%
  select(tenure, MonthlyCharges) %>%
  mutate_at(c("tenure", "MonthlyCharges"), scale)
head(df_cluster)

# Find Optimal Number of Cluster ------------------------------------------

# Elbow Method
fviz_nbclust(df_cluster, kmeans, method = "wss")

# Silhouette Method
fviz_nbclust(df_cluster, kmeans, method = "silhouette")


# Clustering --------------------------------------------------------------

# K-Means Clustering
cluster <- kmeans(df_cluster, centers = 4)
cluster

# Visualize
fviz_cluster(cluster,
  data = df_cluster,
  geom = "point",
  stand = FALSE
)
