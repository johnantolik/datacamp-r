# 2015 US Census Data

counties %>% select(state, county, population, poverty)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

counties_selected %>% arrange(desc(public_work))

counties_selected <- counties %>%
  select(state, county, population)

counties_selected %>% filter(population > 1000000)

counties_selected %>% filter(state == "California", population > 1000000)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

counties_selected %>% filter(state == "Texas", population > 10000) %>% arrange(desc(private_work))

counties_selected <- counties %>%
  select(state, county, population, public_work)

counties_selected %>% mutate(public_workers = population * public_work / 100)

counties_selected <- counties %>%
  select(state, county, population, public_work)

counties_selected %>% mutate(public_workers = public_work * population / 100) %>% arrange(desc(public_workers))

counties_selected <- counties %>% select(state, county, population, men, women)

counties_selected %>% mutate(proportion_women = women/population)

counties %>% 
  select(state, county, population, men, women) %>% 
  mutate(proportion_men = men/population) %>% 
  filter(population >= 10000) %>% 
  arrange(desc(proportion_men))

# Aggregate functions

counties_selected %>%
  count(region, sort = TRUE)

counties_selected %>%
  count(state, wt = citizens, sort = TRUE)

counties_selected %>%
  mutate(population_walk = population * walk / 100) %>% 
  count(state, wt = population_walk, sort = TRUE)

counties_selected %>%
  summarize(min_population = min(population), max_unemployment = max(unemployment), average_income = mean(income))

counties_selected %>%
  group_by(state) %>% 
  summarize(total_area = sum(land_area), total_population = sum(population))

counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population)) %>%
  mutate(density = total_population/total_area) %>% 
  arrange(desc(density))

counties_selected %>%
  group_by(region, state) %>% 
  summarize(total_pop = sum(population))

counties_selected %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>% 
  summarize(average_pop = mean(total_pop), median_pop = median(total_pop))

counties_selected %>%
  group_by(region, state) %>%
  summarize(average_income = mean(income)) %>%
  top_n(1, average_income)

counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population)) %>%
  top_n(1, total_pop) %>%
  ungroup() %>% 
  count(metro)

# Selecting and Transforming Data

glimpse(counties)

counties %>% 
  select(state, county, population, professional:production) %>% 
  arrange(desc(service))

counties %>% 
  select(state, county, population, ends_with("work")) %>% 
  filter(public_work >= 50)

counties %>%  
  count(state) %>% 
  rename(num_counties = n)

counties %>%
  select(state, county, poverty_rate = poverty)

counties %>% 
  transmute(state, county, population, density = population / land_area) %>% 
  filter(population > 1000000) %>% 
  arrange(density)

counties %>% 
  rename(unemployment_rate = unemployment)

counties %>% 
  select(state, county, contains("poverty"))

counties %>% 
  mutate(fraction_women = women / population)

counties %>% 
  transmute(state, county, employment_rate = employed / population)

