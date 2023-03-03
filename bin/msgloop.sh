#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "Usage: $0 <num>"
	exit 1
fi
num=$1

for i in $(seq $num)
do
	/root/bin/msg2.sh
	sleep 0.5
done
