#!/bin/bash

echo -n "Enter A : "
read NUM1

echo -n "Enter Operator : "
read OP

echo -n "Enter C : "
read NUM2

case $OP in
    +) echo "$NUM1 + $NUM2 = $(expr $NUM1 + $NUM2)" ;;
    -) echo "$NUM1 - $NUM2 = $(expr $NUM1 - $NUM2)" ;;
    \*) echo "$NUM1 * $NUM2 = $(expr $NUM1 \* $NUM2)" ;;
    /) echo "$NUM1 / $NUM2 = $(expr $NUM1 / $NUM2)" ;;
    *) echo "[ FAIL ] Nope " ; exit 1 ;;
esac