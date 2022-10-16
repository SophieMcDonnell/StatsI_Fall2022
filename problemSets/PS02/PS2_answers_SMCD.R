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

lapply(c(),  pkgTest)




###############################################################################


###
### QUESTION ONE
###




(
  (((14-13.5)^2)/13.5)
  + (((6-8.4)^2)/8.4)
  + (((7-5)^2)/5)
  + (((7-7.5)^2)/7.5)
  + (((7-4.6)^2)/4.6)
  + (((1-2.9)^2)/2.9)

)


pchisq(4.03, df=2, lower.tail=FALSE)





fo = 1
fe = 2.9
r = 15/42
c = 8/42

(fo-fe)/sqrt(fe*(1-r)*(1-c))




###
### QUESTION 2
###

women <- read.table("https://raw.githubusercontent.com/kosukeimai/qss/master/PREDICTION/women.csv", header=T, sep=",")

lm(water~reserved, data=women)




