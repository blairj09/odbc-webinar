# Load data into Postgres DB
library(tidyverse)
library(DBI)
library(nycflights13)

# Establish connection
flights_con <- dbConnect(RPostgres::Postgres(),
                         dbname = "flights",
                         host = "boeing-odbc-webinar.cloiraotshw4.us-east-1.rds.amazonaws.com",
                         port = 5432,
                         user = "rstudio_user",
                         password = "rstudio")

flights_dev_con <- dbConnect(RPostgres::Postgres(),
                             dbname = "flights_dev",
                             host = "boeing-odbc-webinar.cloiraotshw4.us-east-1.rds.amazonaws.com",
                             port = 5432,
                             user = "rstudio_user",
                             password = "rstudio")

# Write data into flights database
flights <- flights %>% 
  mutate(date = lubridate::make_date(year, month, day))
dbWriteTable(flights_con, "flights", flights, overwrite = TRUE)
dbWriteTable(flights_con, "weather", weather, overwrite = TRUE)
dbWriteTable(flights_con, "planes", planes, overwrite = TRUE)
dbWriteTable(flights_con, "airports", airports, overwrite = TRUE)
dbWriteTable(flights_con, "airlines", airlines, overwrite = TRUE)

# Sample data for flights_dev
p <- 0.3
flights_d <- sample_n(flights, nrow(flights) * p)
weather_d <- sample_n(weather, nrow(weather) * p)
planes_d <- sample_n(planes, nrow(planes) * p)
airports_d <- sample_n(airports, nrow(airports) * p)
airlines_d <- sample_n(airlines, nrow(airlines) * p)

# Write data into flights_dev database
dbWriteTable(flights_dev_con, "flights", flights_d, overwrite = TRUE)
dbWriteTable(flights_dev_con, "weather", weather_d, overwrite = TRUE)
dbWriteTable(flights_dev_con, "planes", planes_d, overwrite = TRUE)
dbWriteTable(flights_dev_con, "airports", airports_d, overwrite = TRUE)
dbWriteTable(flights_dev_con, "airlines", airlines_d, overwrite = TRUE)
