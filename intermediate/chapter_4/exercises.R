# 1

split_math <- strsplit(pioneers, split = ":")
split_math
split_low <- lapply(split_math, tolower)
split_low
str(split_low)

# 2

select_first <- function(x) {
  x[1]
}
names <- lapply(split_low, select_first)
select_second <- function(x) {
  x[2]
}
years <- lapply(split_low, select_second) 

# 3

names <- lapply(split_low, function(x) {x[1]})

years <- lapply(split_low, function(x) {x[2]})

# 4

select_el <- function(x, index) {
  x[index]
}

names <- lapply(split_low, select_el, 1)

years <- lapply(split_low, select_el, 2)

# 5

lapply(list(1, "a", TRUE), str)

# 10 (?)

first_and_last <- function(name) {
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  return(c(first = min(letters), last = max(letters)))
}

sapply(cities, first_and_last)

vapply(cities, first_and_last, character(2))

first_only <- function(name) {
  name <- gsub(" ", "", name)
  letters <- strsplit(name, split = "")[[1]]
  return(c(first = min(letters)))
}

unique_letters <- function(name) {
  name <- gsub(" ","",name)
  letters <- strsplit(name, split = "")[[1]]
  return(unique(letters))
}
+
vapply(cities, unique_letters, character(4) | character(5) | character(7) | character(8) | character(9))


