#!/bin/bash

# this script downloads bigram files using from google api storage. there are 100
# compressed csv files approximately 27GB. Script is expected to run on all the
# three nodes and evenly distributes the load to all three nodes i.e. files
# with id from 0 to 33 are downloaded on node 1

# invoke configuration file
. /gpfs/gpfsfpo/scripts/mumblr.cfg

[ ! -f ${download_dir} ] && mkdir ${download_dir}

case `hostname` in
   "gpfs1.somewhere.net")
       start=0;
       end=33;
       host_dir="gpfs1";
   ;;
   "gpfs2.somewhere.net")
       start=34;
       end=66;
       host_dir="gpfs2";
   ;;
   "gpfs3.somewhere.net")
       start=67;
       end=99;
       host_dir="gpfs3";
   ;;
esac

echo "[`hostname`] [`date`] starting to download files on `hostname`"

for ((i=$start; i<=$end; i++ ))
do
   echo "[`hostname`] [`date`] Downloading file id ${i}"
   wget -P ${download_dir} http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-2gram-20090715-$i.csv.zip
   echo "[`hostname`] [`date`] Completed downloading file id ${i}"
done

touch ${download_dir}/${download_complete}
echo "[`hostname`] [`date`] download completed"
