library(gapminder)
data <- as.data.frame(gapminder)

fahr_to_kelvin <- function(temp){ 
  kelvin = ((temp-32)*(5/9))+273.15
  return(kelvin)
}

fahr_to_kelvin(30)

kelvin_to_celcius <- function(temp){
  celcius= temp-273.15
  return(celcius)
}
kelvin_to_celcius(300)

fahr_to_celsius <- function(temp) {
  if (!is.numeric(temp)) {
    stop("temp must be a numeric vector.")
  }
  temp_k <- fahr_to_kelvin(temp)
  result <- kelvin_to_celsius(temp_k)
  return(result)
}
fahr_to_celcius(hello)


# making a function that multiplies two collumns (dat$pop and dat$gdpPercap)
calcGDP <- function(dat) {
  gdp <- dat$pop * dat$gdpPercap
  return(gdp)
}

# adding a collumn with the values of the two collumns multiplied
data$gdp <- calcGDP(data)


#now instead making a function that multiplies the population column 
#with gdp per capital collin - in a specific year or a specific country
#so in this function the input is both a datafram (where the two collumns are)
#and also a specific year or country 
calcGDP <- function(dat, year=NULL, country=NULL) {
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year, ]
  }
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp=gdp)
  return(new)
}

p <- calcGDP(dat=data, country = c("Denmark", "Norway"))



#make function for removing quotations of text - and adding a wrapper around the text 

fence <- function(text, wrapper){
  text <- c(wrapper, text, wrapper) #here you tell it to add the wrapper on both sides on the text 
  result <- paste(text, collapse = " ") #with the collapse you tell it to remove "" around all abjoects in the text 
  return(result)
}

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
fence(best_practice, wrapper="***")








