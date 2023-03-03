#!/bin/ksh

# 	# crontab -e
# 	Min Hour Day Mon Week CMD
#  	0   8    *   *   *   /root/shell/check_file.sh
#
# 	# cat /root/shell/test/check_file_list.txt
# 	/etc/passwd
# 	/etc/group
# 	/etc/hosts
# 	.....

F_LIST=/root/shell/file_list.txt                    # 점검할 파일 목록
T_FILE=/var/tmp/.tmp1                               # 임시파일
F_RESULT=/root/shell/result.`date +'%m%d'`          # 결과 리포트 파일
EMAIL=root                                          # 결과를 받을 이메일 주소

cp /dev/null $F_RESULT                              # 결과파일 초기화

for F_NAME in `cat $F_LIST`                         # 점검해야 하는 파일 목록 읽기
do
    if [ -f $F_NAME.orig ] ; then                   # 백업파일 존재 유무 확인
        diff $F_NAME $F_NAME.orig > $T_FILE         # 원본파일<-->백업파일 비교
        if [ -s $T_FILE ] ; then
            echo "$F_NAME               [ WARN ]" >> $F_RESULT
        else
            echo "$F_NAME               [  OK  ]" >> $F_RESULT
        fi
    else
        cp $F_NAME $F_NAME.orig
    fi
done

if grep WARN $F_RESULT > /dev/null 2>&1 ; then
#    mailx -s "Critical Satus. Check Files" $EMAIL < $F_RESULT
     echo "WARNNING"
else
#    mailx -s "OK" $EMAIL < $F_RESULT
     echo "OK"
fi
# rm T_FILE 