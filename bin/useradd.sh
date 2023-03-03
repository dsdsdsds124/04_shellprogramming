#!/bin/bash
#   # useradd $UNAME
#   # echo $UPASS | useradd --stdin $UNAME

FILE1=/root/bin/user.list
cat $FILE1 | while read UNAME UPASS
do
  # echo "$UNAME : $UPASS"
  useradd $UNAME
  echo $UPASS | passwd --stdin $UNAME >/dev/null 2>&1
  echo " [ OK ] $UNAME"
done