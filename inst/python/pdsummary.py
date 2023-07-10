import pandas as pd

def pdsummary(df, group):
  summarydf = df.groupby(group).mean()
  return(summarydf)
