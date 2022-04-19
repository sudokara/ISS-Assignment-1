#!/bin/bash

#remove newlines
grep '\S' quotes.txt 

#remove duplicate lines
#put seen lines into a dictionary and print to terminal
echo "--------------------------------- part b---------------------------"
awk '!seen[$0]++' quotes.txt 
