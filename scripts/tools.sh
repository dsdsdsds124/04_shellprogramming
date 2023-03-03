#!/bin/bash

clear
cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo -n "Choose : (1|2|3)"
read CHOICE

# echo $CHOICE
case $CHOICE in
    1) who ;;
    2) date ;;
    3) pwd ;;
    *) echo "[ FAIL ] Worst Number. "
        exit 1 ;;
esac