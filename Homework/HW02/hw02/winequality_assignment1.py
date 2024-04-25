# %% [markdown]
# # Wine Quality - Exploration and Data Preparation
# 
# NOTE: This analysis was adapted from the one published on Github by user `dmclark53`:
# 
# https://github.com/dmclark53/Wine-Quality/blob/master/Wine%20Quality%20-%20Data%20Preparation.ipynb

# %% [markdown]
# ## Required Packages
# We recommend you use virtual environments managed by Poetry. 
# You will need the packages listed below installed in your 
# virtual environment (if they aren't already):
# 
# `numpy  pandas  seaborn  natsort  matplotlib`

# %%
# Import the necessary libraries
import numpy as np
import pandas as pd
import seaborn as sb
from matplotlib import pyplot as plt
from natsort import natsorted

sb.set_context("notebook", font_scale=2.5) # Comment this line if you are running directly in Python.
%matplotlib inline

# %% [markdown]
# ### Load the data
# 
# The data can be loaded with the Pandas `read_csv` method.  Use the full path
# to where you have saved "winequality-red.csv" as the filename.  Remember, the
# separator in these files is a semi-colon, so you will have to supply use 
# the `sep` argument.  Documentation at:
# https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html

# %%
# Load the data into a Pandas DataFrame
red_wine = pd.read_csv('winequality_data/winequality-red.csv', sep=';')

# %%
# Load the data into a Pandas DataFrame
#red_wine = TODO:_COMPLETE_THIS_STATEMENT_TO_READ_THE_CSV_FILE_THEN_UNCOMMENT

# %% [markdown]
# ### Data Exploration

# %% [markdown]
# TODO: Use the `head` method of the `red_wine` DataFrame to verify visually that
# the data were loaded correctly.

# %%
# TODO: Use the `info` method of the `red_wine` DataFrame to verify visually that
# the data types are you you expect.

# %%
# TODO: Use the `describe` method of the `red_wine` DataFrame to examine the ranges
# of values found in the dataset.  You may prefer to transpose the output by adding
# the additional `.T` to the end if you like.


# %% [markdown]
# ### Data Visualization
# Make a scatter plot matrix using seaborn to visualize the data and the relationship between the different features.

# %%
# TODO: Print the column names of the `red_wine` dataframe using its `columns` attibute.

#print( TODO:_COMPLETE_THIS_PART ) # Complete this statement then un-comment to run it.

# %%
# We often want to avoid the "output" column (the dependant variable is quality)
# So, create a list of columns that doesn't include 'quality':
# (HINT): since 'quality' is the last column, you want all of the column names
# except the last one -- you can use Python list slicing notation to get "all except
# the last" item.

#column_list = TODO:_COMPLETE_THIS_STATEMENT_AND_UNCOMMENT

# %%
# These are our input variables (hopefully independent variables, but we'll see...)
# NOTE: The following should output the column names _without_ 'quality'.

#print(column_list) # TODO: UNCOMMENT THIS LINE AFTER COMPLETING THE PREVIOUS TODO ITEM.

# %% [markdown]
# Now we can create a Seaborn "pairplot" to show each pair of variables plotted as
# a scatterplot against each other, with histograms of each variable's values along
# the diagonal.
# See options at:
# https://seaborn.pydata.org/generated/seaborn.pairplot.html
# We suggest using a "height" option between 3 and 5.

# %%
# TODO: write a statement to create the pairplot here:



