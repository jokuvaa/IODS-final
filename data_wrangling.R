# Mika Vehka
# mika.vehka@helsinki.fi
# 12.12.2017
# Data wrangling on Boston dataset.

# First let's load the Boston data from the MASS package.

library(MASS)
data(Boston)

# Then let's explore the structure and dimensions of the data.

head(Boston)
dim(Boston)
str(Boston)

# The data has 506 observations (towns) and 14 variables. The variables include for example per capita crime rate and important variables related to the population and environment 

# The variables are:

# crim: per capita crime rate by town. 
# zn: proportion of residential land zoned for lots over 25,000 sq.ft. 
# indus: proportion of non-retail business acres per town. 
# chas: Charles River dummy variable (= 1 if tract bounds river; 0 otherwise). 
# nox: nitrogen oxides concentration (parts per 10 million). 
# rm: average number of rooms per dwelling. 
# age: proportion of owner-occupied units built prior to 1940. 
# dis:weighted mean of distances to five Boston employment centres. 
# rad: index of accessibility to radial highways. 
# tax: full-value property-tax rate per \$10,000. 
# ptratio: pupil-teacher ratio by town. 
# black: 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town. 
# lstat: lower status of the population (percent). 
# medv: median value of owner-occupied homes in \$1000s. 

library(corrplot)
library(GGally)
library(dplyr)

bos_pairs<-ggpairs(Boston)
bos_pairs

bos_cor<-corrplot(cor(Boston))
bos_cor

# From here we can see that for example variables tax and rad have a strong correlation, so it is suitable to exclude the other from regression analysis.

# Also variables with very small variation are exluded if they are not very importanta (for example zn)

# Also variables that cannot give meaningful interpretation are excluded at this point (chas).

# So, let's build our final dataset:

Boston_final<-Boston%>%
  select(-c(rad,chas,zn))

str(Boston_final)

# Then let's save the data...

write.csv(Boston_final,"C:/Users/Omistaja/Documents/GitHub/IODS-final/Boston_final.csv")
