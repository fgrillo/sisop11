#!/bin/bash

LOG_DIR=/home/fgrillo/Documents/sisop11/logs

mp=$1
fs=$2
bs=$3
fsize=$4

echo 'KB reclen write rewrite read reread read write'
for file in `ls $LOG_DIR/${mp}GB/experiment_${fs}_${bs}_${fsize}_*`; do
    grep -A1 -E '^\s*KB' $file | tail -1 | awk '{print $1,$2,$3,$4,$5,$6,$6,$7 }'
done
