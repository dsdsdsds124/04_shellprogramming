#!/bin/bash

echo -n "Filename? : " 
read FILE1

# echo $FILE1
if [ -f $FILE1 ] ; then
  echo "Normal File."
elif [ -d $FILE1 ] ; then
  echo "Directory."
else 
  echo "Syntax Error"
fi