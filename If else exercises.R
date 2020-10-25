library(gapminder)
data <- as.data.frame(gapminder)

#basic loop 1
if (nrow(data[(data$year==2002),]>=1)){
  print("Record(s) for the year 2002 found")
}
#basic loop 2
if(any(data$year==2002)){
  print("Record(s) for the year 2002 found")
}




best_practice <- c("Write", "programs", "for", "people", "not", "computers")
#simply looping over all elements in the vector
for (i in best_practice){
  print(i)
}

# looping over two lists at once
for (i in 1:5) {
  for (j in c('a', 'b', 'c', 'd', 'e')) {
    print(paste(i,j))
  }
}

# here you can see that it loops over a, b, c, d and e 
# for all 1's first, then do it for all 2's etc
#so it does all things in the second for loop for the first element in our list
# before it contines to the second element in the initial list



#now saving the output from the for loop in a vector
#using the paste function which uses as.character to print all elements
#in a vector .. it contatecates/seperates the elements and gives a character result "" for all elements
#når du skriver paste(i,j) så printer den i og j i den samme ""
output_vector <- c()
for (i in 1:5) {
  for (j in c('a', 'b', 'c', 'd', 'e')) {
    temp_output <- paste(i, j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector





#######################solution, challenge 3
thresholdValue <- 50

for (i_continent in unique(gapminder$continent)){
  continent_subset <- gapminder[gapminder$continent == i_continent,]
  continent_subset_mean <- mean(continent_subset$lifeExp)
  print(continent_subset_mean)
  if(continent_subset_mean < thresholdValue){
    cat("Average Life Expectancy in", i_continent, "is less than", thresholdValue, "\n")
  }
  else{
    cat("Average Life Expectancy in", i_continent, "is greater than", thresholdValue, "\n")
  } # end if else condition
  rm(continent_subset_mean)
} # end for loop


#here you make a subset for each unique continent called continent_subset
#you then calculate the mean of lifeExp for each of these subsets 
#and then you use if/else to check if the mean is above or below the thresholdValue 
#if it eg is above then you print out (with the cat function) that the lifeexp in the continent
#in question is above the threshold value




#solution challenge 4

thresholdValue1 <- 50
thresholdValue2 <- 70

for (i_country in unique(gapminder$country)){
  country_subset <- gapminder[gapminder$country == i_country,]
  country_subset_mean <- mean(country_subset$lifeExp)
  print(country_subset_mean)
  if(country_subset_mean < thresholdValue1){
    cat("Average Life Expectancy in", i_country, "is less than", thresholdValue1, "\n")
  }
  else if(thresholdValue1 < country_subset_mean && country_subset_mean < thresholdValue2){
    cat("Average Life Expectancy in", i_country, "is between", thresholdValue1, "and", thresholdValue2, "\n")
  } 
  else {
    cat("Average Life Expectancy in", i_country, "is above", thresholdValue2, "\n")
  }
} 





