# This Python 3 environment comes with many helpful analytics libraries installed
# It is defined by the kaggle/python docker image: https://github.com/kaggle/docker-python
# For example, here's several helpful packages to load in

import numpyas np# linear algebra
import pandas as pd# data processing, CSV file I/O (e.g. pd.read_csv)

from sklearnimport preprocessing
from sklearn.model_selectionimport train_test_split
from sklearnimport linear_model
from sklearn.svmimport SVR
from sklearn.treeimport DecisionTreeRegressor


# Input data files are available in the "../input/" directory.
# For example, running this (by clicking run or pressing Shift+Enter) will list the files in the input directory


defprepare_data(df, forecast_col, forecast_out, test_size):
    label = df[forecast_col].shift(-forecast_out)  # creating new column called label with the last 5 rows are nan
print(label)
    X = np.array(df[[forecast_col]]) # creating the feature array
X = preprocessing.scale(X)  # processing the feature array
X_lately = X[-forecast_out:]  # creating the column i want to use later in the predicting method
X = X[:-forecast_out]  # X that will contain the training and testing
label.dropna(inplace=True)  # dropping na values
y = np.array(label)  # assigning Y
X_train, X_test, Y_train, Y_test = train_test_split(X, y, test_size=test_size)  # cross validation

response = [X_train, X_test, Y_train, Y_test, X_lately]
return response


df = pd.read_csv("prices.csv")  # loading the csv file
df = df[df.symbol == 'GOOG']  # choosing stock symbol

forecast_col = 'close'  # choosing which column to forecast
forecast_out = 5  # how far to forecast
test_size = 0.2

X_train, X_test, Y_train, Y_test, X_lately = prepare_data(df, forecast_col, forecast_out, test_size)

learner = linear_model.LinearRegression()
learner2 = SVR()
learner3 = linear_model.BayesianRidge()
learner4 = DecisionTreeRegressor()
learner5 = linear_model.Ridge()

learner.fit(X_train, Y_train)
score = learner.score(X_test, Y_test)

learner2.fit(X_train, Y_train)
score2 = learner2.score(X_test, Y_test)

learner3.fit(X_train, Y_train)
score3 = learner3.score(X_test, Y_test)
learner4.fit(X_train, Y_train)
score4 = learner4.score(X_test, Y_test)

learner5.fit(X_train, Y_train)
score5 = learner5.score(X_test, Y_test)

forecast = learner.predict(X_lately)
forecast2 = learner2.predict(X_lately)
forecast3 = learner3.predict(X_lately)
forecast4 = learner4.predict(X_lately)
forecast5 = learner5.predict(X_lately)

response = {}
response['test_score'] = [score, score2, score3, score4, score5]
response['forecast_set'] = [forecast, forecast2, forecast3, forecast4, forecast5]


print(response)
