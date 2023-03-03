#!/bin/bash

for i in `seq 1 10`
do
        PER=$(expr $i \* 10)
        echo -ne "$PER% |"

        START=1
        while [ $START -le $i ]
        do
                echo -ne "=="
                START=`expr $START + 1`
        done

        if [ $i -ne 10 ] ; then
                echo -ne ">"
        else
                echo -ne "| complete\n"
        fi

        echo -ne "\r"
        sleep 1
done