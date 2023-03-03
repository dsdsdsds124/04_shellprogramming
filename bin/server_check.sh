#!/bin/bash

TMP1=/tmp/tmp1

export LANG=en_US.UTF-8
DATE=$(date +'%Y.%m.%d %H:%M:%S')
# echo -n "Enter your name : "
# read NAME
NAME="CDS"
OS=$(cat /etc/centos-release)
KERNEL=$(uname -sr)
CPU=$(lscpu | grep '^CPU(s)' | awk '{print $2'})
MEM=$(free -h | grep '^Mem' | awk '{print $2}')
DISK=$(lsblk -S | awk '$3 == "disk" {print $0}')

cat << EOF

Server Vul. Checker version 1.0
DATE: $DATE
NAME: $NAME

(1) Server Information
============================================
OS : $OS
Kernel : $KERNEL
CPU : $CPU
MEM : $MEM
DISK : $DISK 
EOF

nmcli connection | grep -vw ' -- ' | tail -n +2 | awk '{print $4}' > $TMP1
DNS=$(for i in $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
do
    echo -n "$i "
done)

SEQ=$(nmcli connection | grep -vw ' -- ' | tail -n +2 | wc -l)
for i in $(seq $SEQ)
do
    NIC=$(sed -n "${i}p" $TMP1)
    cat << EOF
Netwrok ${i} ($NIC):
    * IP : $(ifconfig $NIC | grep -w 'inet' | awk '{print $2}')
    * Netmask : $(ifconfig $NIC | grep -w 'inet' | awk '{print $4}')
    * Defaultrouter : $(ip route | grep default | awk '{print $3}')
    * DNS : $DNS
EOF
done
echo "  * Defaultrouter : $(ip route | grep default | awk '{print $3}')"
echo "  * DNS : $DNS"