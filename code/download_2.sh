#!/bin/bash

mkdir gpfs2

for ((i=34; i<=66; i++ ))
do
   echo "Downloading file id ${i}"
   wget -P /gpfs/gpfsfpo/gpfs2 http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip

done
