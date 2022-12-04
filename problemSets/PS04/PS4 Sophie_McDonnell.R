#####################
# load libraries
# set wd
# clear global .envir
#####################

# remove objects
rm(list=ls())
# detach all libraries
detachAllPackages <- function() {
  basic.packages <- c("package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "package:base")
  package.list <- search()[ifelse(unlist(gregexpr("package:", search()))==1, TRUE, FALSE)]
  package.list <- setdiff(package.list, basic.packages)
  if (length(package.list)>0)  for (package in package.list) detach(package,  character.only=TRUE)
}
detachAllPackages()

# load libraries
pkgTest <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,  "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg,  dependencies = TRUE)
  sapply(pkg,  require,  character.only = TRUE)
}

# here is where you load any necessary packages
# ex: stringr
# lapply(c("stringr"),  pkgTest)

# set wd for current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))




################################################################################






install.packages(car)
library(car)
data(Prestige)
help(Prestige)


### Q1

Prestige$professional <- ifelse(Prestige[['type']]=='prof', 1, 0)

q1 <- lm( prestige ~ income + professional + income:professional, data=Prestige )
summary(q1) 

# y = 0.003171x1 + 37.78x2 - 0.002326x1x2 + 21.14
# Income coefficient close to zero, little influence 
# Professional coefficient is significant 

prestige_subset <- Prestige[which(Prestige$professional == 1),]
prestige_subset$income <- 1000 + prestige_subset$income
q1_subset <- lm( prestige ~ income + professional + income:professional, data=prestige_subset )
summary(q1_subset) 
# The intercept is greater, but income has less influence 
# y = 0.0008452x1  + 58.08

prestige_subset2 <- Prestige
prestige_subset2$income <- 6000
q1_subset2 <- lm( prestige ~ professional, data=prestige_subset2 )
summary(q1_subset2) 
# Intercept is greater, and influence of professional decreases but still significant
# y = 30.02x2 + 37.83



### Q2







