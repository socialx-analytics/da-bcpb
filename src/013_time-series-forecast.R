
# Load Packages and Import Data -------------------------------------------

# Load Packages
library(tidyverve)
library(lubridate)
library(readxl)
library(timetk)
library(tidymodels)
library(modeltime)

# Import Data
df <- read_csv("data/ts-data.csv")

# Explore Data ------------------------------------------------------------

# Check Data
glimpse(df)

# Fix Data
df_fix <- df %>%
  mutate(date = dmy(date))

# Visualize Data
df_fix %>%
  plot_time_series(date, income, .interactive = FALSE)

# Split -------------------------------------------------------------------

# Split
splits <- df_fix %>%
  time_series_split(assess = "1 year", cumulative = TRUE)

# Visualize split
splits %>%
  tk_time_series_cv_plan() %>%
  plot_time_series_cv_plan(date, income, .interactive = FALSE)

# Modelling ---------------------------------------------------------------

# Set ARIMA Model
model_fit_arima <- arima_reg() %>%
  set_engine("auto_arima") %>%
  fit(income ~ date, training(splits))

# Set ETS Model
model_fit_ets <- exp_smoothing() %>%
  set_engine(engine = "ets") %>%
  fit(income ~ date, data = training(splits))

# Set Prophet
model_fit_prophet <- prophet_reg() %>%
  set_engine(engine = "prophet") %>%
  fit(income ~ date, data = training(splits))

# Add model to model table
model_table <- modeltime_table(
  model_fit_arima,
  model_fit_ets,
  model_fit_prophet
)

# Calibrate
calibration_table <- model_table %>%
  modeltime_calibrate(testing(splits))
calibration_table

# Evaluation --------------------------------------------------------------

# Show Model Performance
calibration_table %>%
  modeltime_accuracy() %>%
  table_modeltime_accuracy(.interactive = FALSE)

# Visualize
calibration_table %>%
  modeltime_forecast(actual_data = df_fix) %>%
  plot_modeltime_forecast(.interactive = FALSE)

# Make forecast for 12 month
calibration_table %>%
  modeltime_refit(df_fix) %>%
  modeltime_forecast(h = "12 months", actual_data = df_fix) %>%
  plot_modeltime_forecast(.interactive = FALSE)
