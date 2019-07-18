# ODBC connections with R and RStudio

This short webinar highlights the best practices described at
[db.rstudio.com](https://db.rstudio.com/) for managing ODBC connections in R.
This webinar uses a PostgreSQL database containing data from the
[`nycflights13`](https://github.com/hadley/nycflights13) R package. _This
database will remain in place until July 31, 2019._

## Database
The PostgreSQL database used for these materials is accessed using the
[PostgreSQL RStudio Professional
Driver](https://www.rstudio.com/products/drivers/). If you don't have access to
this driver, you can use any PostgreSQL ODBC driver or use the
[`RPostgres`](https://github.com/r-dbi/RPostgres) R package to connect to the
database. An example DSN for accessing each database can be found in
[`odbc.ini`](odbc.ini).

[`load-data`](R/load-data.R) contains the code used to populated each database.
There are two databases that are used: `flights` and `flights_dev`. `flights`
contains all of the data from the `nycflights13` package while `flights_dev`
contains a random subset of that data.

## Basics
Connecting to databases via ODBC in R can be done using the
[`odbc`](https://github.com/r-dbi/odbc) package. These resources show how to
make connections using DSNs and using the
[`config`](https://github.com/rstudio/config) R package.
[`odbc-basics`](R/odbc-basics.Rmd) illustrates the basics of creating
connections to the database and executing queries using `dbplyr` and `DBI`.
[`tidy-db`](R/tidy-db.Rmd) dives further into `dbplyr` and how it can be used to
perform common data wrangling tasks in the database instead of in R.

## Deployment
[`deploy.Rmd`](R/deploy.Rmd) provides a simple RMarkdown document that can be
published to [RStudio Connect](https://www.rstudio.com/products/connect/). When
published along with `config.yml`, the deployed document will automatically use
the full `flights` database instead of the `flights_dev` database. This is
because of the `rsconnect` entry in [`config.yml`](R/config.yml). Further
details about using the `config` package with RStudio Connect can be found in
the [RStudio Connect Administration
Guide](https://docs.rstudio.com/connect/admin/process-management.html#using-the-config-package).

---
![](images/overview.png)
