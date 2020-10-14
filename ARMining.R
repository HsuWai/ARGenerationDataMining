library(arules)
library(arulesViz)
min_length = 2
max_length = 2
min_support = 0.05
conf = 0.1

# Dataset 1
groceries_data_set1 <- read.transactions("./groceries_dataset_1.csv", sep = ",", rm.duplicates = TRUE)
summary(groceries_data_set1)

#Frequent Itemsets
#all the 2-itemsets having at least a support of 0.05
itemsets_1 <- apriori(
  groceries_data_set1, 
  parameter = list(minlen=min_length, maxlen = max_length, support = min_support, target="frequent itemsets")
)
summary(itemsets_1)

#print all 2-itemsets in descending order of support
inspect(sort(itemsets_1, by="support"))

#Rule Generation
groceryrules_1 <- apriori(groceries_data_set1, parameter = list(support =min_support, confidence = conf, minlen = min_length, target = "rules"))
summary(groceryrules_1)

#print all rules
inspect(groceryrules_1)

## End of Dataset 1 ##
############################################
