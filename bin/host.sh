#!/bin/bash

# HOSTS=/etc/hosts
HOSTS=hosts
NET=172.16.6

for i in $(seq 200 249)
do
        [ $C_IP = $i ] && continue
        echo "$NET.$i   linux$i.example.com     linux$i" >> $HOSTS
done