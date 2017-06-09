#!/bin/bash

sudo apt-get install unzip

mkdir gpfs2

for ((i=34; i<=66; i++ ))
do
   echo "Downloading file id ${i}"
   wget -P /gpfs/gpfsfpo/gpfs2 http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip
   echo "Unzipping file id ${i}"
   unzip /gpfs/gpfsfpo/gpfs2/googlebooks-eng-all-2gram-20090715-$i.csv -d /gpfs/gpfsfpo/gpfs2
   rm /gpfs/gpfsfpo/gpfs2/googlebooks-eng-all-2gram-20090715-$i.csv.zip
done
