#!/bin/bash

echo -n "Enter number 1 : "
read NUM1

echo -n "Enter number 2 : "
read NUM2

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF

echo -n "Enter your choice? (1|2|3|4) : "
read OP

case $OP in
    1) echo "$NUM1 + $NUM2 = $(expr $NUM1 + $NUM2)" ;;
    2) echo "$NUM1 - $NUM2 = $(expr $NUM1 - $NUM2)" ;;
    3) echo "$NUM1 * $NUM2 = $(expr $NUM1 \* $NUM2)" ;;
    4) echo "$NUM1 / $NUM2 = $(expr $NUM1 / $NUM2)" ;;
    *) echo "[ FAIL ] Nope " ; exit 1 ;;
esac