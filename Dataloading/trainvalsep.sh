#!/bin/bash

dir=$(pwd)
dir1="$dir/trainfold"
dir2="$dir/train"
dir3="$dir/val"
count=0

while [ $count -le 14950 ]
do
  dir_input="$dir1/$count"
  dir_output_train="$dir2/$count"
  dir_output_val="$dir3/$count"
  
  numImages=$(ls $dir_input | wc -l)
  cd $dir_input
  i=0
  while read line
  do
        array[ $i ]="$line"        
	    (( i++ ))
	  done < <(ls)

  #echo ${array[1]}
  
  if [ $numImages -eq 1 ]; then
    echo "1 image only"
    cp "$dir_input/*" "$dir_output_train"
    cp "$dir_input/*" "$dir_output_val"


  elif [ $numImages -ge 2 ] && [ $numImages -le 5 ]; then
    echo "2-5 image only"
    cp "$dir_input/${array[0]}" "$dir_output_val"
    j=1
    while [ $j -lt $numImages ]
    do
      cp "$dir_input/${array[$j]}" "$dir_output_train"
      ((j++))
    done


  elif [ $numImages -ge 6 ] && [ $numImages -le 10 ]; then
    echo "6-10 image only"
    cp "$dir_input/${array[0]}" "$dir_output_val"
    cp "$dir_input/${array[1]}" "$dir_output_val"
    j=2
    while [ $j -lt $numImages ]
    do
      cp "$dir_input/${array[$j]}" "$dir_output_train"
      ((j++))
    done

  else
    echo ">10 image only"
    numVal=$(python -c "from math import floor; print( floor($numImages/3.0))")
    j=0
    while [ $j -lt $numVal ]
    do
      cp "$dir_input/${array[$j]}" "$dir_output_val"
      ((j++))
    done
    k=$numVal
    while [ $k -lt $numImages ]
    do
      cp "$dir_input/${array[$k]}" "$dir_output_train"
      ((k++))
    done
  fi
((count++))
    
done
