#!/bin/bash
: << EOF
for i in $(cat file1)
do
    echo $i;
done
EOF
cat file1 | while read j
do
    echo "$UNAME : $UPASS"
done

