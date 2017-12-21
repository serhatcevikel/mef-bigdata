#!/usr/bin/env bash
# adjusted by Serhat Cevikel to measure the time

#START=$(date +%s.%N)
path=$1
starty=$2
endy=$3

years=$(seq $starty $endy)


for year in $years
do
    filee="${path}/${year}"
  echo -ne `basename $year .gz`"\t"
  gunzip -c $filee | \
    awk '{ temp = substr($0, 88, 5) + 0;
           q = substr($0, 93, 1);
           if (temp !=9999 && q ~ /[01459]/ && temp > max) max = temp }
         END { print max }'
done
#END=$(date +%s.%N)
#DIFF=$(echo "$END - $START" | bc)
#echo $DIFF
