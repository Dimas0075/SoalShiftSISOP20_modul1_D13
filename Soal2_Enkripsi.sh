#!/bin/bash

besar=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
kecil=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" )

jam=`date +"%H"`

judul=`echo $1 | tr [A-Za-z] ["${besar[$jam]}"-ZA-"${besar[$jam-1]}""${kecil[$jam]}"-za-"${kecil[$jam-1]}"] | tr -d [:digit:] | cut -d '.' -f1`
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 > $judul.txt
