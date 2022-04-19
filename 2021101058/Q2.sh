#!/bin/bash

file="quotes.txt"
i=1
#read quotes.txt line by line
while read -r line;
do
#search for tilda(~) and print everything after that(the author) if it exists
#then add once said"
#then print the quote 
#then print the final double quote
#whenever output of eccho is appended to a file, a newline is added
#to remove this the truncate command is used
    if [[ $(echo -n ${line} | awk -F '~' '{print $2}' | wc --w) != 0 ]];
    then
    echo -n ${line} | awk -F '~' '{ print $2 }' >> speech.txt
    truncate --size -1 speech.txt
    echo -n " once said \"" >> speech.txt
    echo ${line} | awk -F '~' '{ print $1 }' >> speech.txt
    truncate --size -2 speech.txt
    echo "\"" >> speech.txt
    fi
    let i=$i+1
done <$file

