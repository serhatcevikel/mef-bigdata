#!/bin/bash

files=( $(find $dataset01/tsv/ -mindepth 1 | grep -Pe ".*[^2]\.tsv") ) # get tsv files that do not end with "2"
for line in "${files[@]}"; # across the selected filenames
	do
		echo -e "$line\n"; # echo file name
		line2=${line/.tsv/2.tsv}; # create file name to be saved into, ending with 2
		cat $line | tail -n+2 > $line2; # delete the first line and save into file 2
		echo -e "$line\n"; # print original file name
		cat $line | wc -l; # print line count of original file
		echo -e "$line2\n"; # print new file name
		cat $line2 | wc -l; # print line count of new file
		diff $line $line2; # print the differences between first and second files
	done

