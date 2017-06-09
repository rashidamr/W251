#!/bin/bash


sudo apt-get install unzip

for ((i=30; i<=33; i++ ))
do
   echo "Downloading file id ${i}"
   wget -P /gpfs/gpfsfpo/gpfs1 http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip
   echo "Unzipping file id ${i}"
   unzip googlebooks-eng-all-2gram-20090715-$i.csv.zip -d /gpfs/gpfsfpo/gpfs1
   rm 20090715-$i.csv.zip
done
