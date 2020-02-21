#!/bin/bash
for ((a=1;a<29;a++))
do
        wget "https://loremflickr.com/320/240/cat" -O pdkt_kusuma_$a -o wget.log
done
