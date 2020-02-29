#!/bin/bash

besar=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
kecil=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" )

jam=`date +"%H"`

judul=`echo $1 | tr ["${besar[$jam]}"-ZA-"${besar[$jam-1]}""${kecil[$jam]}"-za-"${kecil[$jam-1]}"] [A-Za-z] | tr -d [:digit:] | cut -d '.' -f1`
cat $1 >> $judul.txt
