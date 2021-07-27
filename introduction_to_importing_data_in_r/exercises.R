# Import swimming_pools.csv

pools <- read.csv("swimming_pools.csv.csv")

str(pools)

# Import swimming_pools.csv with stringsAsFactors = FALSE

pools <- read.csv("swimming_pools.csv", stringsAsFactors = FALSE)

str(pools)

# read.delim with hotdogs.txt

## read.delim VS read.table VS read.csv
## read.csv = read.table where sep = ","

hotdogs <- read.delim("hotdogs.txt", header = FALSE)

summary(hotdogs)

# read.table with hotdogs.txt

path <- file.path("C:", "Users", "John Antolik", "Documents", "hotdogs.txt")
hotdogs <- read.table(path, 
                      sep = "\t", 
                      col.names = c("type", "calories", "sodium"))
head(hotdogs)

# read.delim with hotdogs & select observation with which...[hotdogs(df$col), ]

hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"))

hotdogs

lily <- hotdogs[which.min(hotdogs$calories), ]

lily

tom <- hotdogs[which.max(hotdogs$sodium), ]

tom

# read.delim

hotdogs2 <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"), colClasses = c("factor", "NULL", "numeric"))

# read.csv2, read.delim2 for non-US and non-UK data using "," instead of "'." for decimal places

# readr - read_csv

install.packages(readr)

library(readr)

# read_tsv

properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")
potatoes <- read_tsv("potatoes.txt", col_names = properties)
head(potatoes)

# read_delim = read.table

properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")
potatoes <- read_delim("potatoes.txt", delim = "\t", col_names = properties)
potatoes

# readr - skip and n_max

properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")
potatoes_fragment <- read_tsv("potatoes.txt", col_names = properties, skip = 6, n_max = 5)
potatoes_fragment

# read_tsv - col_types = "cccccccc" i.e., all as character type

properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")
potatoes_char <- read_tsv("potatoes.txt", col_names = properties, col_types = "cccccccc")
str(potatoes_char)

# hotdogs.txt

hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

summary(hotdogs)

fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

summary(hotdogs)

fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

## Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("hotdogs.txt",
                           col_names = c("type", "calories", "sodium"),
                           col_types = list(fac, int, int))

## Display the summary of hotdogs_factor
summary(hotdogs_factor)


# data.table - fread

install.packages("data.table")
library("data.table")

potatoes <- fread("potatoes.csv")
potatoes

potatoes <- fread("potatoes.csv", select = c(6,8))

potatoes

## Plot texture (x) and moistness (y) of potatoes

plot(x = potatoes$texture, y = potatoes$moistness, type = "p")

# readxl package

## excel_sheets() & read_excel()

install.packages("readxl")
library("readxl")

excel_sheets("foreign_direct_investment_net_inflows_percent_of_gdp.xlsx")

read_excel("foreign_direct_investment_net_inflows_percent_of_gdp.xlsx")

pop_1 <- read_excel("urbanpop.xlsx", sheet = 1)
pop_2 <- read_excel("urbanpop.xlsx", sheet = 2)
pop_3 <- read_excel("urbanpop.xlsx", sheet = 3)

## Put pop_1, pop_2 and pop_3 in a list: pop_list

pop_list <- list(pop_1, pop_2, pop_3)

## Display the structure of pop_list

str(pop_list)

# Use lapply function to read all sheets in a workbook

pop_list <- lapply(excel_sheets("urbanpop.xlsx"), read_excel, path = "urbanpop.xlsx")
str(pop_list)

# read_excel : other arguments

## Import the first Excel sheet of urbanpop_nonames.xlsx (R gives names): pop_a

pop_a <- read_excel("urbanpop_nonames.xlsx", col_names = FALSE)

pop_a

## Import the first Excel sheet of urbanpop_nonames.xlsx (specify col_names): pop_b

cols <- c("country", paste0("year_", 1960:1966))

pop_b <- read_excel("urbanpop_nonames.xlsx", col_names = cols)

## Print the summary of pop_a and pop_b

summary(pop_a)

summary(pop_b)

## Import the second sheet of urbanpop.xlsx, skipping the first 21 rows: urbanpop_sel

urbanpop_sel <- read_excel("urbanpop.xlsx", col_names = FALSE, sheet = 2, skip = 21)

## Print out the first observation from urbanpop_sel

urbanpop_sel[1]

# gdata

## Load the gdata package

install.packages("gdata")
library("gdata")

## Import the second sheet of urbanpop.xls: urban_pop

urban_pop <- read.xls("urbanpop.xls", sheet = 2)

## Print the first 11 observations using head()

head(urban_pop, n = 11)

## Column names for urban_pop
columns <- c("country", paste0("year_", 1967:1974))

## Finish the read.xls call
urban_pop <- read.xls("urbanpop.xls", sheet = 2,
                      skip = 50, header = FALSE, stringsAsFactors = FALSE,
                      col.names = columns)

## Print first 10 observation of urban_pop

head(urban_pop, n = 10)

## Add code to import data from all three sheets in urbanpop.xls
path <- "urbanpop.xls"
urban_sheet1 <- read.xls(path, sheet = 1, stringsAsFactors = FALSE)
urban_sheet2 <- read.xls(path, sheet = 2, stringsAsFactors = FALSE)
urban_sheet3 <- read.xls(path, sheet = 3, stringsAsFactors = FALSE)

## Extend the cbind() call to include urban_sheet3: urban
urban <- cbind(urban_sheet1, urban_sheet2[-1], urban_sheet3[-1])

urban

## Remove all rows with NAs from urban: urban_clean
urban_clean <- na.omit(urban)

## Print out a summary of urban_clean

summary(urban_clean)

