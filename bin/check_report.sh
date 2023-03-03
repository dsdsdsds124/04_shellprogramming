#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Usage: $0 <U-#>"
    exit 1
fi


sed -n '/U-$NUM1/,/U-$NUM2/p' report.txt