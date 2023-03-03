#!/bin/bash

echo -n " Your Choice (Yes/No)"
read CHOICE

case $CHOICE in
    YES|Yes|yes|Y|y) echo "[ OK ] Nice " ;;
    No|no|N|n) echo "[ FAIL ] z";;
    *) echo "[ FAIL ] whaT?"
        exit 1 ;;
esac