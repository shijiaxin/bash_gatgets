#!/bin/bash

#double loop
echo "running double-for-loop"
total_j=5
total_i=3
for((i =$(($total_i -1));i>=0;i-- ));do
        for((j =$(($total_j -1));j>=0;j-- ));do
        curr=$(($i * $total_j + $j))
        echo $curr
        done
done

#loop in a simple list
echo "running x-in-a-list"
for x in 1 4 7 10;
do
    echo $x
done 

#loop in complex array
echo "running loop in complex array"
#  ${arr[*]}         # All of the items in the array
#  ${!arr[*]}        # All of the indexes in the array
#  ${#arr[*]}        # Number of items in the array
#  ${#arr[0]}        # Length of item zero
A=(1 2 3) #no space before or after =
B=(Jan Feb Mar)
for i in ${!A[*]};
do
  echo ${B[$i]} ${A[$i]}
done

