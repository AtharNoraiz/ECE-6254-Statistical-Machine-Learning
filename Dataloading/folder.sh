#!/bin/bash

count=0

while [ $count -le 14950 ]
do
  mkdir ./$count
  ((count++))
done

echo All done
