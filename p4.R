# Importara datos en CSV --------------------------------------------------
datos <- read.csv(file="datos/LA MOLINA 2014 POTATO WUE (FB) - fb.csv",
                  header=TRUE, sep=",")
datos


# en TSB ----------------------------------------------------------------
datos <- read.table("datos/LA MOLINA 2014 POTATO WUE (FB) - fb.tsv", sep = "\t",
                    header = TRUE)
datos
head(datos)

# EXCEL -------------------------------------------------------------------
install.packages("readxl")
library(readxl)
datos <- read_excel("datos/LA MOLINA 2014 POTATO WUE (FB).xlsx", sheet = "fb")
datos
library(openxlsx)
dtxl <- openxlsx::read.xlsx(""datos/LA MOLINA 2014 POTATO WUE (FB).xlsx", )

# Rstudio import ----------------------------------------------------------

dtos <- read_excel("datos/LA MOLINA 2014 POTATO WUE (FB).xlsx")

# google shaels -----------------------------------------------------------
library
url <- https://docs.google.com/spreadsheets/d/15r7ZwcZZHbEgltlF6gSFvCTFA-CFzVBWwg3mFlRyKPs/edit?gid=172957346#gid=172957346
gs <- as_sheets_id(url)
fb <- range_read(gs,sheet="fb")


