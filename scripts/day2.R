3+4
3 + 4 
3 + 4
weight_kg <- 55

mickey <- 27
x2 <- 3


my_weight_kg <- 50
(my_weight_kg <- 50)
(my_weight <- 50)
my_weight
my_weight

2.2 * my_weight_kg

weight_kg <- 57

weight_1b <- 2.2*weight_kg
weight_1b
#The wiegt has been updated 50 to 100

wieght_kg <- 100

mass = 47.5
age = 122
mass = mass * 2.0
age = age - 20
mass_index = mass/age

sqrt

sqrt(9)

weight_kg = sqrt(9)

#What is round ()

round = 5*2.5
round
round = round
round
round (3.14512)
round (3.14159, 2)
age = 210/2.2
age
roundoff = round (digits 2, age)
roundoff
my_function = function (x) {
  x = x+2
}
my_result = my_function (3)
my_result
View(my_function)


weight_g = c(50, 60, 65,82)
animals = c("mouse", "rat", "tiger", "lion")
#get the lenght of the values
length(animals)
length(weight_g)

#get the type of data contained in the vector
class(animals)
class(weight_g)

#structure (str) of the object to see the length

str(animals)
str(weight_g)

#how to add an element values in the data to begining of a vector
animals = c("cincilla", animals)
animals
animals = c(animals, "frog")
animals <- c(animals, "frog")
animals

str(animals)

weight_g
weight_g = c ("34", "44", weight_g)
weight_g

typeof(weight_g)
class(animals)
animals
str(animals)

# what happen in the next cases

num_char = c(1, 2, 3, "a")
num_char

typeof(num_char)

num_logical = c(1, 2, 3, TRUE)
num_logical
char_logical = c ("a", "b", "c", TRUE)
char_logical
trucky = c(1, 2, 3, "4")

#logical = numeric = character
#logical = character

#subsetting a vector
animals[2]
animals[c(1, 2)]
#c for subseeting add more
more_animals = animals[c(1, 2, 3, 2, 1, 4)]
more_animals

weight_g
weight_g[3]
weight_g[c(FALSE, FALSE, TRUE, TRUE)]
weight_g = 63
weight_g[weight_g > 63]
weight_g[c(F, FALSE, T, TRUE)]
weight_g[c(F, FALSE, T, TRUE,FALSE, T, TRUE)]

weight_g[weight_g > 63 & weight_g > 80]
weight_g[weight_g > 63 | weight_g > 80]

#<, >, ==, !=, <=, >=, ! is not logical

weight_g[weight_g > 63 & weight_g == 80]
weight_g[weight_g >= 50]
weight_g==65
animals[animals == "rat" | animals == "frog"]

heights = c(2, 4, 4, NA, 6)
mean(heights)
mean(heights, na.rm = T)
# "NA, NA, TRUE
is.na(heights)
str(heights)


#identify which are the misisng data (a.k.a NA)
is.na(heights)

# omit the missing and NA data code is na.omit
na.omit()

#Challenege
heights = c(63, 69, 60,55, NA, 68, 61, 70, 61, 59, 64, 69, 63,6)
str(heights)
median(heights)
heights = na.omit(heights)
heights
median(heights)
mean(heights)
length(heights)
heights[heights > 67]
greaterthan67=heights [heights > 67]
greaterthan67
length(greaterthan67)
mean(greaterthan67)
median(greaterthan67)

heights = c(63, 69, 60,55, NA, 68, 61, 70, 61, 59, 64, 69, 63,6)
heights_no_na= na.omit(heights)
heights_no_na = heights[!is.na(heights)]
median(heights, na.rm = T)
heights_no_na
sum(heights_no_na > 67)
