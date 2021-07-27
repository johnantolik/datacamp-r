# Case Study: Baby Names

glimpse(babynames)

babynames %>%
  filter(year == 1990) %>%
  arrange(desc(number))

babynames %>%
  group_by(year) %>%
  top_n(1, number)

selected_names <- babynames %>% 
  filter(name %in% c("Steven", "Thomas", "Matthew"))
ggplot(selected_names, aes(x = year, y = number, color = name)) + geom_line()

babynames %>% 
  group_by(year) %>% 
  mutate(year_total = sum(number)) %>% 
  ungroup() %>% 
  mutate(fraction = number/year_total) %>% 
  group_by(name) %>% 
  top_n(1, fraction)

names_normalized <- babynames %>%
  group_by(name) %>% 
  mutate(name_total = sum(number), name_max = max(number)) %>% 
  ungroup() %>% 
  mutate(fraction_max = number / name_max)

names_normalized <- babynames %>%
  group_by(name) %>% 
  mutate(name_total = sum(number), name_max = max(number)) %>% 
  ungroup() %>% 
  mutate(fraction_max = number / name_max)

# Plot Filtered Names Fraction_max

names_filtered <- names_normalized %>% 
  filter(name %in% c("Steven", "Thomas", "Matthew"))
ggplot(names_filtered, aes(x = year, y = fraction_max, color = name)) + geom_line()
  
# Window Functions : lag(x)

babynames_fraction %>% 
  arrange(name, year) %>% 
  group_by(name) %>% 
  mutate(ratio = fraction / lag(fraction))

babynames_ratios_filtered %>% 
  top_n(1, ratio) %>% 
  arrange(desc(ratio)) %>% 
  filter(fraction >= 0.001)


