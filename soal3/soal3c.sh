tempat=`pwd`
filter=`ls $tempat | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ ! -d "$tempat/kenangan" ]]
then
        mkdir $tempat/kenangan
fi

if [[ ! -d "$tempat/duplicate" ]]
then
        mkdir $tempat/duplicate
fi

if [[ $filter =~ [^0-9] ]]
then
        filter=0
fi

pertama=`expr $filter + 1`
terakhir=`expr $filter + 28`

for ((a=pertama; a<=terakhir; a++));
do
        wget -O pdkt_kusuma_$a https://loremflickr.com/320/240/cat -o $tempat/wget.log
done

for ((a=1;a<=filter;a++))
do
        loc="`cat $PWD/wget.log | grep "Location:" | head -$a | tail -1 | cut -d " " -f 2`"
        echo $loc >> location.log
done

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
                                                                                                                                                                                          50,16         All
