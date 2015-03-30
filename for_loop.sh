#!/bin/bash

total_j=6
total_i=4
for((i =$(($total_i -1));i>=0;i-- ));do
        for((j =$(($total_j -1));j>=0;j-- ));do
        curr=$(($i * $total_j + $j))
        echo $curr
        done
done


