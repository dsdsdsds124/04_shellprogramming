#!/bin/bash

for i in $(cat ftpusers | egrep -v '^#')
do
    echo $i
    read
done