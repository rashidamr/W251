import numpy as np
import pandas as pd
import xlrd
import csv
import zipfile


for i in range(33):
    m = '/gpfs/gpfsfpo/gpfs1/googlebooks-eng-all-2gram-20090715-'+str(i)+'.csv.zip'
    n = 'googlebooks-eng-all-2gram-20090715-'+str(i)+'.csv.zip'

    zf = zipfile.ZipFile(m)
    df = pd.read_csv(zf.open(n), header = None, delimiter="\t", quoting=csv.QUOTE_NONE, encoding='utf-8')

    df1 = df[[0,2]]
    df2=df1.rename(columns={df1.columns[0] : "strings", df1.columns[1]: "Occurance"})
    df3= pd.DataFrame(df2.groupby("strings")["Occurance"].sum())
    df3.reset_index(level=0, inplace=True)

    df3.to_csv("clean1.csv", header=False, mode = 'a')
