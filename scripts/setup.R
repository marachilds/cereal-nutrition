# Require dplyr
library(dplyr)

# Read in cereal.tsv
data.file <- read.table(file = "./data/cereal.tsv", header = TRUE)

# Create the cereal data set
cereal <- data.file %>% 
          mutate(cereal.name = gsub("_|-", " ", data.file$name)) %>% 
          select(-type, -shelf, -weight, -cups)
  
# Create options
opt <- c("Calories" = 'calories', "Protein" = 'protein',
         "Fat" = 'fat', "Sodium" = 'sodium',
         "Fiber" = 'fiber', "Carbohydrates" = 'carbo',
         "Sugars" = 'sugars', "Potassium" = 'potass',
         "Vitamins" = 'vitamins')