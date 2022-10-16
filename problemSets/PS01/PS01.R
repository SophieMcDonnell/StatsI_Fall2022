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

# set working directory
setwd("~/Documents/GitHub/StatsI_Fall2022/problemSets/PS01")


#####################
# Problem 1
#####################

y <- c(105, 69, 86, 100, 82, 111, 104, 110, 87, 108, 87, 90, 94, 113, 112, 98, 80, 97, 95, 111, 114, 89, 95, 126, 98)

plot(density(y))
qqnorm(y)
qqline(y, distribution = qnorm)

CI_lower <- qnorm(0.05, 
                  mean = mean(y), 
                  sd = (sd(y)/sqrt(length(y)))
)

CI_upper <- qnorm(0.95,
                  mean = mean(y), 
                  sd = (sd(y)/sqrt(length(y)))
)

matrix(c(CI_lower, CI_upper), ncol = 2,
       dimnames = list("",c("Lower", "Upper")))

var.test(y,
         ratio = 1,
         alternative = "two.sided",
         conf.level = 0.95)




#####################
# Problem 2
#####################

expenditure <- read.table("~/Documents/GitHub/StatsI_Fall2022/datasets/expenditure.txt", header=T)

plot(expenditure$X1, expenditure$Y)
plot(expenditure$X2, expenditure$Y)
plot(expenditure$X3, expenditure$Y)

boxplot(Y~Region, data=expenditure)
means <- tapply(expenditure$Y, expenditure$Region, mean)
points(means,col="red",pch=18)
means

plot(expenditure$X1, expenditure$Y, col=expenditure$Region, pch=expenditure$Region)
legend("topleft", legend=1:4, col=1:4, pch=1:4)


