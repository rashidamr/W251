#!/bin/bash


sudo apt-get install unzip

mkdir gpfs1

for ((i=0; i<=3; i++ ))
do
   echo "Downloading file id ${i}"
   wget -P /gpfs/gpfsfpo/gpfs1 http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip
   echo "Unzipping file id ${i}"
   unzip googlebooks-eng-all-2gram-20090715-$i.csv -d /gpfs/gpfsfpo/gpfs1
   rm googlebooks-eng-all-2gram-20090715-$i.csv.zip
done
