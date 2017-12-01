# Set working directory
setwd("~/specdata")
# Check the files by listing them
list.files()

# pollutantmean() function
pollutantmean <- function(directory, pollutant, id = 1:332) {
        # Assign all the files to one variable
        allfiles <- list.files(directory, full.names = TRUE)
        # Create an empty data frame where all the datasets will be pooled
        dat <- data.frame()
        # for loop to rbind all the datasets and store them into "dat"
        for (i in id) {
                dat <- rbind(dat, read.csv(allfiles[i]))
        }
        # Mean of dat, specifically the pollutant column, as indicated [, pollutant]
        # Also set na.rm to TRUE in order to remove the pesky NAs
        mean(dat[, pollutant], na.rm = TRUE)
}

# Tests
pollutantmean("~/specdata", "sulfate", 34)
pollutantmean("~/specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 23)

# It finally works
