#!/bin/bash

#IFS=","
dir=$(pwd)
dir_input="/home/kolon/PycharmProjects/SML/input/train"
dir_output="${dir}/trainfold"
#count=1
while IFS=, read f1 f2 f3
do
  #if [ $count -eq 10 ]; then
  #  break
  #fi
  str2=".jpg"
  str=$(sed -e 's/^"//' -e 's/"$//' <<<"$f1")
  echo $str
  cp "$dir_input/$str$str2" "$dir_output/$f3"
  #((count++))
done < train.csv
