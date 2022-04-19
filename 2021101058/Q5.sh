#!/bin/bash

read -p "enter the string to reverse: " string
len=${#string}

#part a
#take each character in reverse and
#append it to revstring variable
for (( i=$len-1; i>=0; i-- ))
do
    revstring=$revstring${string:$i:1}
done
echo $revstring

#part b
#
for (( i=0; i<$len; i++ ))
do
    if [[ ${revstring:$i:1} =~ [a-z] ]]; then
        echo -n $(echo ${revstring:$i:1} | tr '[a-y]z' '[b-z]a')
    elif [[ ${revstring:$i:1} =~ [A-Z]  ]]; then
        echo -n $(echo ${revstring:$i:1} | tr '[A-Y]Z' '[B-Z]A')
    else
        echo -n ${revstring:$i:1}
    fi
done
echo

#part c
#first half of the new string is
#in the reverse order
for(( i=(($len/2))-1; i>=0; i-- ))
do
    halfrev=$halfrev${string:$i:1}
done

#second half of the new string is
#the same as second half of the
#original string
for(( i=$len/2; i<$len; i++ ))
do
    halfrev=$halfrev${string:$i:1}
done
echo $halfrev
