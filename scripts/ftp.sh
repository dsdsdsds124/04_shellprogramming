#!/bin/bash

HELP() {
  cat << EOF
  Commands may be abbreviated.  Commands are:

!               debug           mdir            sendport        site
$               dir             mget            put             size
account         disconnect      mkdir           pwd             status
append          exit            mls             quit            struct
EOF
}

ERROR() {
   [ "$CMD" ] && echo "[ WARN ] Invalid command"
}

while true
do
    echo -n "ftp> "
    read CMD
    case $CMD in
        'quit'|'bye') break ;;
        'help') HELP ;;
        *) ERROR ;;
    esac
done