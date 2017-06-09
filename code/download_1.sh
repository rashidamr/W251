#!/bin/bash

mkdir gpfs1

for ((i=0; i<=33; i++ ))
do
   echo "Downloading file id ${i}"
   wget -P /gpfs/gpfsfpo/gpfs1 http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip

done
