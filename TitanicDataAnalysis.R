#load raw data
train <- read.csv("train.csv", header = TRUE)
test <- read.csv("test.csv", header = TRUE)

# Add a "survived" variable to the test set to allow for combining data sets
test.survived <- data.frame(Survived = rep("None", nrow(test)), test[,]) 

#Order columns
test.survived <- test.survived[c(2,1,3,4,5,6,7,8,9,10,11,12)]

#print columnnames
colnames(data.combined)
colnames(test.survived)
colnames(train)

#Combine data sets, append table
data.combined <- rbind(train, test.survived)

#Data Types
str(data.combined)
str(train)

#columntype ändern
data.combined$Pclass <- as.factor(data.combined$Pclass)
data.combined$Survived <- as.factor(data.combined$Survived)
train$Pclass <- as.factor(train$Pclass)

#take a look at gross survival: Tabelle$Spalte
table(data.combined$Survived)
table(data.combined$Pclass)

#Install a package
install.packages("stringi")
install.packages("stringr")
install.packages("ggplot2")

#Load up ggplot2 package
library(ggplot2)

#Hypthesis - Rich folks survived at a higher rate
#Generate AESthetic 
ggplot(train, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(width = 0.5) +
  xlab("Pclass") +
  ylab("Total Count") +
  labs(fill = "Survived")


