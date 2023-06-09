# performs random forrest algorithm on ML_data_train, generates predictions on ML_data_test

print("Decision tree initializing")

if(!require(xgboost)) {install.packages("xgboost")}
library(xgboost)

dtrain <- xgb.DMatrix(data = as.matrix(subset(ML_data_train, select = - c(outcome_column))), label = as.matrix(ML_data_train[,"outcome_column"]))
# this has separated x and y

bst <- xgboost(data = dtrain, max.depth = 2, eta = 1, nthread = 2, nrounds = 7, objective = "binary:logistic", verbose = 2)
# this has performed the gradient-boosted random forest algorithm

pred = predict(bst, as.matrix(subset(ML_data_test, select = - c(outcome_column))))
# generated predictions
