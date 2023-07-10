import pandas as pd

def pdmean(df, group):
  df = df.groupby(group).mean()
  return(df)
  
def pdvar(df, group):
  df = df.groupby(group).var()
  return(df)

def pdselect(df, cols):
  df = df[cols]
  return(df)
  
def divide(x,y):
  return(x/y)

