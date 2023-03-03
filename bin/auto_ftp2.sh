#!/bin/bash

for i in $(cat /root/bin/server.txt)
do

ftp -n $i 21 << EOF
user root centos
cd /tmp
lcd /test
bin
hash
prompt
mput testfile.txt
quit
EOF

done