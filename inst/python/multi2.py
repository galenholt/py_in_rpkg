import pandas as pd

def pdmin(df, group):
  df = df.groupby(group).min()
  return(df)
  
def pdsum(df, group):
  df = df.groupby(group).sum()
  return(df)
  
def minus(x,y):
  return(x-y)

