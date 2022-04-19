#!/bin/bash

#part 1
#find size in bytes and only print the size and not file name
x=$(wc --b $1 | awk '{print $1}')
echo "$x bytes"

#part 2
#count the line endings, i.e. count lines
#wc did not always give the right answer
lines=$(grep -c '^' $1)
echo "$lines lines"

#part 3
#count words and print only the number of words and not file name
x=$(wc --w $1 | awk '{print $1}')
echo "$x words"

#part 4
#for every line in 1 to number of lines in the file,
#count the number of words in this line

file="$1"
i=1
while read -r line;
do
    echo "Line no:$i - Count of words : $(echo $line | wc --w)"
    let i=$i+1
done <$file

#part 5
#cat the file,remove characters that are not (alphanumeric/newline/spaces), replace spaces with newlines
#put all the seen words with their count into a dictionary
#if it is seen more than once and the word is not empty print the word and its count
cat $1 | tr -cd "[:alnum:] \n'" | tr " " "\n" |  awk '{seen[$0]++}; END {for (i in seen){ if (seen[i] != 1 && i!="") print "<"i">" "-" seen[i]-1 }}'