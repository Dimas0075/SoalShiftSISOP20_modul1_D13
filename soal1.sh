echo "Soal 1 A"
awk -F"\t" 'NR > 1 {sen[$13] += $21}
END { for (i in sen) print i,sen[i] }' /home/dimas/Downloads/Sample-Superstore.tsv | sort -n | head -1
printf "\n"
echo "Soal 1 B"
awk -F"\t" 'NR > 1 {if ($13 == "Central") sen[$11] += $21}
END { for (i in sen) print sen[i],i }' /home/dimas/Downloads/Sample-Superstore.tsv | sort -n | head -2
printf "\n"
echo "Soal 1 C"
echo "List Item :"
awk -F"\t" 'NR > 1 {if ($11 == "Texas" || $11 == "Illinois" ) sen[$17] += $21}
END { for (i in sen) print sen[i],i }' /home/dimas/Downloads/Sample-Superstore.tsv | sort -n | head -10
