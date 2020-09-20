# Assignment: ASSIGNMENT 5
# Name: Simek, Kathryn
# Date: 2020-09-20

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/katie/OneDrive/Documents/GitHub/dsc520")

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())
# library (Hmisc)
library (pastecs)
library (psych)

acs_df <- read.csv("data/acs-14-1yr-s0201.csv")

str(acs_df)

nrow(acs_df)

ncol(acs_df)

ggplot(acs_df, aes(HSDegree))+geom_histogram(bins = 68) +
      ggtitle("Likelyhood of High School Degree Per County") +
      xlab("Percent of Population with HS Degree") +
      ylab("Number of Counties")

ggsave("histogram1.png",width = 5, height = 5)

ggplot(acs_df, aes(HSDegree))+geom_histogram(bins = 68) +
  ggtitle("Likelyhood of High School Degree Per County") +
  xlab("Percent of Population with HS Degree") +
  ylab("Number of Counties")  


ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins = 68) +
  ggtitle("Likelyhood of High School Degree Per County") +
  xlab("Percent of Population with HS Degree") +
  ylab("Number of Counties") + 
  stat_function(fun = dnorm, args = list(mean = mean(acs_df$HSDegree, 
                                                     na.rm = TRUE), 
                                         sd = sd(acs_df$HSDegree, 
                                                 na.rm = TRUE)))

ggsave("histogram1_with_curve.png",width = 5, height = 5)

ggplot(acs_df, aes(HSDegree))+geom_density() +
  ggtitle("Likelyhood of High School Degree Per County") +
  xlab("Percent of Population with HS Degree") +
  ylab("Number of Counties")

ggsave("density1.png",width = 5, height = 5)

library(moments)
skewness(acs_df$HSDegree)
kurtosis(acs_df$HSDegree)

hsdegree_z <-(acs_df$HSDegree - mean(acs_df$HSDegree)) / sd(acs_df$HSDegree)
scale(acs_df$HSDegree)
