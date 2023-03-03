#!/bin/bash
#   # userdel $UNAME
#   # echo $UPASS | useradd --stdin $UNAME

FILE1=/root/bin/user.list
cat $FILE1 | while read UNAME UPASS
do
  userdel -r $UNAME
  echo "[ OK ] $UNAME"
done