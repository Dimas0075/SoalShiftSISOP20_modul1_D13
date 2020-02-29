#!/bin/bash

tempat=`pwd`
filter=`ls $tempat | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ $filter =~ [^0-9] ]]
then
        filter=0
fi

pertama=`expr $filter + 1`
terakhir=`expr $filter + 28`

for ((a=pertama; a<=terakhir; a++));
do
        wget https://loremflickr.com/320/240/cat -O pdkt_kusuma_$a -o $tempat/wget.log
done

