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
