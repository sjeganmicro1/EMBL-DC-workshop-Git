#data.frames
#let's import some date
download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")
library(readr)
View(portal_data_joined)
str(portal_data_joined)
library(tidyverse)
surveys= read_csv("data_raw/portal_data_joined.csv")

read.csv()
head(surveys)
view(surveys)

str(surveys)
tail(surveys)
names(surveys)

#equivalent to
colnames(surveys)
rownames(surveys)

summary(surveys)

#indexing and subsetting

surveys[1, 6]
surveys[, 1]
surveys[1, ]

surveys[c(1, 2, 3), c(5, 6)]

surveys["sex"]

surveys[row.names(200)]
print(n=200)

#challenage
surveys_200=surveys[200, ]
surveys_200

surveys_200_again = c(surveys [200, 1])
str(surveys_200_again)
nrow(surveys)
#only inlast row [nrow(surveys), ]
surveys[nrow(surveys), ]

nrow(surveys)/2

surveys[ nrow(surveys)/2, ]

#factors
str(surveys)

surveys$sex = factor(surveys$sex)
surveys$sex

#converts factors like M and F into 1 and 2

levels(surveys$sex)
nlevels(surveys$sex)


sex = factor(c("male", "female", "female", "male"))
sex
#rearrnage the order of sex into male to female

sex = factor(sex, levels = c("male", "female"))
sex
# challenge

surveys$taxa

surveys$taxa = factor (surveys$taxa)
surveys$genus = factor (surveys$genus)
levels(surveys$taxa)
nlevels(surveys$taxa)

levels(surveys$genus)
nlevels(surveys$genus)

sum(surveys$taxa =="Rabbit")
summary(surveys)

#convert factors

as.character(sex)


year_fct = factor (c(1990, 1983, 1977, 1997))
year_fct
as.numeric(year_fct)

as.numeric(as.character(year_fct))
as.numeric(levels(year_fct)) [year_fct]

#renaming factor
plot(surveys$sex)
summary(surveys$sex)

sex=surveys$sex
levels(sex)
#add value in the data

sex = addNA(sex)
levels(sex)
#addition of another vector using []
levels(sex) [3] = "undetermined"
levels(sex)
sex
plot(sex)


plot(factor(c("a", "b", "a", "a", "a")))
levels(sex)

levels(sex[1:2]) = c("female", "male")


#tiddy verse
library (tidyverse)

filter(surveys, year == 1995, sex == "M")
surveys2=filter(surveys, weight <5)

surveys
view()
surveys %>%
  filter(weight < 5)%>%
  select(species_id, sex, weight)

surveys %>%
  filter(year < 1995) %>%
  select (year, sex, weight)

#unit conversion

surveys %>%
  mutate (weight_kg = weight/1000) %>%
  view()

surveys %>%
  mutate (weight_kg = weight/1000, weight_lb = weight_kg * 2.2) %>%
  view()

surveys %>%
  mutate (weight_kg = weight/1000, weight_lb = weight_kg * 2.2) %>%
  head()

#filter function
surveys %>%
  filter(!is.na(weight)) %>%
  mutate (weight_kg = weight/1000, weight_lb = weight_kg * 2.2) %>%
  head()

surveys %>%
  group_by(sex) %>%
  summarise(mean_weight = mean (weight, na.rm = T))

surveys %>%
  filter(!is.na(sex)) %>%
  group_by(sex) %>%
  summarise(mean_weight = mean (weight, na.rm = T))

surveys %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T))

#filitering na values

surveys %>%
  filter(!is.na(sex)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T)) %>%
  print(n = 15)

surveys %>%
  filter(!is.na(weight), !is.na(sex)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T), min_weight = min(weight)) %>%
  arrange(mean_weight)%>%
  print (n =15)
  
surveys %>% 
  filter(!is.na(weight), !is.na(sex)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T), min_weight = min(weight)) %>%
  arrange(mean_weight)%>%
  print (n =15)

surveys %>% 
  filter(!is.na(weight), !is.na(sex)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T), min_weight = min(weight)) %>%
  arrange(min_weight)%>%
  print (n =15)

survey_new = surveys %>% 
  count (sex, species) %>% 
  arrange (species, desc (n)) %>% 
  view()

surveys %>% 
  filter(!is.na(hindfoot_length), !is.na(species_id)) %>%
  group_by(hindfoot_length, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T), min_weight = min(weight)) %>%
  arrange(min_weight)%>%
  print (n =15)

surveys %>% 
  filter(!is.na(hindfoot_length), !is.na(species_id)) %>%
  group_by(hindfoot_length, species_id) %>%
  summarise(mean_weight = mean (weight, na.rm = T), min_weight = min(weight)) %>%
  arrange(min_weight)%>%
  print (n =15)

surveys %>%
  count(plot_type)
#ex.2
surveys %>%
  filter(!is.na(hindfoot_length)) %>% 
  group_by(species_id) %>% 
  summarise(
    mean_hindfoot_length = mean(hindfoot_length),
    min_hindfoot_length = min(hindfoot_length),
    max_hindfoor_lenght = max(hindfoot_length),
    n = n()
  ) %>% 
  view()

#ex.3
surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(year) %>% 
  filter(weight == max(weight)) %>% 
  select(year, genus, species_id, weight) %>% 
  arrange(year) %>% 
  View()
