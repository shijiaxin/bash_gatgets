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

echo "running x-in-a-list"
for x in 1 4 7 10;
do
    echo $x
done 
