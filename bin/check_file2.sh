#!/bin/bash

F_LIST=/root/bin/file_list.txt
T_FILE=/tmp/tmp1
T_FILE2=/tmp/tmp2
T_FILE3=/tmp/tmp3
F_RESULT=/root/bin/result.$(date +'%m%d')
EMAIL=root
BACKUPDIR=/backup

> $F_RESULT


for F_NAME in $(cat $F_LIST)
do
    #==> echo $F_NAME
    DIRNAME=$(dirname $F_NAME)
    FILENAME=$(basename $F_NAME)
    BACKUPFILE=$BACKUPDIR/$FILENAME.orig
    # echo "$DIRNAME $FILENAME $BACKUPFILE" ; read
    if [ -f $BACKUPFILE ] ; then
        diff $F_NAME $BACKUPFILE > $T_FILE
        if [ -s $T_FILE ] ; then
            echo "[ WARN ]  $F_NAME" >> $F_RESULT
            /bin/cp $F_NAME $BACKUPFILE.$(date +%m%d_%H%M%S)
            /bin/cp $F_NAME $BACKUPFILE
        else
            echo "[ OK ]    $F_NAME" >> $F_RESULT
        fi
    else
        /bin/cp $F_NAME $BACKUPFILE
    fi

done

grep -qw WARN $F_RESULT
if [ $? -eq 0 ]  ; then
    mailx -s "WARNNING" $EMAIL < $F_RESULT
else
   mailx -s "OK" $EMAIL < $F_RESULT
fi
# rm T_FILE                 # tempory file delete