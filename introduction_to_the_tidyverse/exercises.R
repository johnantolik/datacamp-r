# Introduction to the tidyverse from DataCamp

install.packages("gapminder")

install.packages("dplyr")

library("gapminder")

gampinder

gapminder %>% filter(year == 2007)

gapminder %>% filter(year == 1957)

gapminder %>% filter(country == "China", year == 2002)

gapminder %>% arrange(lifeExp)

gapminder %>% arrange(desc(lifeExp))

gapminder %>% filter(year == 1957) %>% arrange(desc(pop))

gapminder %>% mutate(lifeExpMonths = lifeExp * 12)

gapminder %>% filter(year == 2007) %>% mutate(lifeExpMonths = 12 * lifeExp) %>% arrange(desc(lifeExpMonths))

gapminder_1952 <- gapminder %>% filter(year == 1952)

# Visualization

ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + scale_x_log10()

ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point() + scale_x_log10() + scale_y_log10()

ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent)) +
  geom_point() + scale_x_log10() + scale_y_log10()

ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) +
  geom_point() +
  scale_x_log10()

ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  scale_x_log10() + facet_wrap(~ continent)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) + geom_point() + scale_x_log10() + facet_wrap(~ year)

# Summarize verb

gapminder %>% summarize(medianlifeExp = median(lifeExp))

gapminder %>% filter(year == 1957) %>% summarize(medianlifeExp = median(lifeExp))

gapminder %>% filter(year == 1957) %>% summarize(medianlifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

gapminder %>% group_by(year) %>% summarize(medianLifeExp = median(lifeExp), maxGDPPercap = max(gdpPercap))

gapminder %>% filter(year == 1957) %>% group_by(continent) %>% summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

gapminder %>% group_by(year, continent) %>% summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Visualization II

by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

ggplot(by_year, aes(x = year, y = medianLifeExp)) + geom_point() + expand_limits(y = 0)

by_year_continent <- gapminder %>% group_by(year, continent) %>% summarize(medianGdpPercap = median(gdpPercap))
  
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) + geom_point() + expand_limits(y = 0)

by_continent_2007 <- gapminder %>% filter(year == 2007) %>% group_by(continent) %>% summarize(medianLifeExp = median(lifeExp), medianGdpPercap = median(gdpPercap))

ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, color = continent)) + geom_point()

# Line Plots

by_year <- gapminder %>% group_by(year) %>% summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year, aes(x = year, y = medianGdpPercap)) + geom_line() + expand_limits(y = 0)

by_year_continent <- gapminder %>% group_by(year, continent) %>% summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) + geom_line() + expand_limits( y = 0)

# Bar Plots : geom_col()

by_continent <- gapminder %>% filter(year == 1952) %>% group_by(continent) %>% summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_continent, aes(x = continent, y = medianGdpPercap)) + geom_col()

oceania_1952 <- gapminder %>% filter(year == 1952, continent == "Oceania")

ggplot(oceania_1952, aes(x = country, y  = gdpPercap)) + geom_col()

# Histograms : geom_histogram()

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

ggplot(gapminder_1952, aes(x = pop_by_mil)) + geom_histogram(bins = 50)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(pop)) + geom_histogram() + scale_x_log10()

# Box Plots : geom_boxplot()

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) + geom_boxplot() + scale_y_log10()

ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() + 
  ggtitle("Comparing GDP per capita across continents")


