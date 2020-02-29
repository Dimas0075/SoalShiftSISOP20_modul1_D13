temp=""
for ((a=1;a<=filter;a++))
do
        loc="`cat $PWD/location.log | grep "/cache/resized/" | head -$i | tail -1 | cut -d "/" -f 4`"
        flag=`echo -e $temp | awk -v loc=$loc 'BEGIN {flag=0} {if (loc==$0) flag=1} END {printf "%d", flag}'`

        if [[ $flag == 1 ]]
        then
        mv $PWD/pdkt_kusuma_$a $PWD/duplicate/duplicate_$a
                #echo "duplicate"
        else
                temp="$temp$loc\n"
        mv $PWD/pdkt_kusuma_$a $PWD/kenangan/kenangan_$a
        fi
done

cat $PWD/wget.log >> $PWD/wget.log.bak
rm $PWD/wget.log
