#!/bin/bash

Usage() {
    echo "Usage: $0 {httpd|nginx}"
    exit 1
}

[ $# -ne 1 ] && Usage
WEB=$1

case $WEB in
    'httpd') systemctl stop nginx ; /root/bin/httpd.sh ;;
    'nginx') systemctl stop httpd ; /root/bin/nginx.sh ;;
    *) Usage ;;
esac
