#!/bin/bash

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3
TMP4=/tmp/tmp4

# 1. PV
# 2. VG
# 3. LV

while true
do
clear
echo "####################### PV 생성 ###########################"

fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2

cat << EOF

############# PV VIEW #############
$(cat $TMP1 $TMP2 | sort | uniq -u)
###################################

EOF

# (2) Works
echo "위의 목록에서 PV로 생성하고 싶은 볼륨을 선택하세요."
echo -n "(ex: /dev/sdb1 /dev/sdc1 ...) : "
read VOLUME

cat << EOF

    다음 명령어를 정말 실행하시겠습니까?
    # pvcreate $VOLUME
    * yes: 실행, no: 다시 설정, skip: 작업 건너뛰기

EOF
echo -n "(yes|no|skip) : "
read CHOICE
case $CHOICE in
    yes) : ;;
    no) continue ;;
    skip) break ;;
    *) continue ;;
esac

pvcreate $VOLUME >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[  OK  ] Physical volume $VOLUME successfully created."
    pvs
else
    echo "[ FAIL ] Physical volume not created."
    exit 1 
fi
break
done
sleep 2
clear
while true
do
echo "####################### VG 생성 ###########################"

vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4
for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done

cat << EOF

################# PV List #################
$(cat $TMP4)
###########################################

EOF

echo -n "VG 이름은? (ex: vg1) : "
read VGNAME

echo -n "VG를 생성할 PV를 적어 주세요. (ex: /dev/sdb1 /dev/sdc1 ...) : "
read PVLIST

cat << EOF

    다음 명령어를 정말 실행하시겠습니까?
    # vgcreate $VGNAME $PVLIST
    * yes: 실행, no: 다시 실행, skip: 작업 건너뛰기, exit: 프로그램 종료

EOF
echo -n "(yes|no|skip) : "
read CHOICE
case $CHOICE in
    yes) :       ;;
    no) continue ;;
    skip) break  ;;
    exit) exit 8 ;;
    *) continue  ;;
esac

vgcreate $VGNAME $PVLIST >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[  OK  ] Volume group $VGNAME successfully created"
    vgs
else
    echo "[ FAIL ] Volume group not created."
    exit 2
fi
break
done
sleep 2
clear
while true
do
echo "####################### LV 생성 ###########################"

cat << EOF

################# VG List #################
$(vgs | awk '$7 != '0' {print $0}')
###########################################

EOF


echo -n "LV를 생성할 VG 이름은? (ex: vg1) : "
read VGLV

echo -n "생성할 LV 이름은? (ex: lv1) : "
read LVNAME

echo -n "LV 용량은? (ex: 500m) : "
read LVSIZE

cat << EOF

    다음 명령어를 정말 실행하시겠습니까?
    # lvcreate $VGLV -n $LVNAME -L $LVSIZE
    * yes: 실행, no: 재설정, exit: 프로그램 종료

EOF
echo -n "(yes|no|exit) : "
read CHOICE
case $CHOICE in
    yes) : ;;
    no) continue ;;
    exit) exit 9 ;;
    *) continue  ;;
esac

lvcreate $VGLV -n $LVNAME -L $LVSIZE >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[  OK  ] Logical Volume $LVNAME successfully created."
    lvs
else
    echo "[ FAIL ] Logical Volume not created."
    exit 3
fi
break
done