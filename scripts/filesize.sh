#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <filenmame>"
  exit 2
fi
FILE1=$1

FILESIZE=$(wc -c $FILE1)
# echo $FILESIZE

if [ $FILESIZE -ge 5120 ] ; then
  echo "Large File :($FILESIZE) bytes"
else
  echo "Small File :($FILESIZE) bytes"
fi