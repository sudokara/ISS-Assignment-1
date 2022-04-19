#!/bin/bash

#read input into string input
read -p "enter the values: " input
arr=()

#separate values using field separator as comma(,) 
#store each value into array 
let b=0
for i in ${input//,/ }
do
    arr[$b]=$i
    let b=b+1
done

#n is the length of the array
let n=${#arr[@]}
let n=n-1

#bubble sorting the array
for (( k=0; k<$n; k++ ))
do
    for (( j=0; j<$n; j++ ))
    do
        if [[ ${arr[$j]} -gt ${arr[$((j+1))]} ]]
        then
            temp=${arr[j]}
            arr[$j]=${arr[$((j+1))]}
            arr[$((j+1))]=$temp
        fi
    done
done

#print the sorted array
echo "Sorted: ${arr[*]}"