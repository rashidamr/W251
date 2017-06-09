#!/bin/bash

sudo apt-get install unzip

mkdir gpfs3

for ((i=68; i<=99; i++ ))
do
   echo "Downloading file id ${i}"
   wget -P /gpfs/gpfsfpo/gpfs3 http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip
   echo "Unzipping file id ${i}"
   unzip /gpfs/gpfsfpo/gpfs3/googlebooks-eng-all-2gram-20090715-$i.csv -d /gpfs/gpfsfpo/gpfs3
   rm /gpfs/gpfsfpo/gpfs3/googlebooks-eng-all-2gram-20090715-$i.csv.zip
done
