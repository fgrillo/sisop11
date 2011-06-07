#!/bin/bash

TEMP_DEVICE=/dev/sda9
TEMP_MOUNT=/tmp/test_fs
TEMP_FILE=/tmp/test_fs/temp_file
LOG_DIR=/home/fgrillo/Documents/sisop11/logs
IOZONE=/usr/bin/iozone
IOZONE_PARAMS="-R -r 4k -i 0 -i 1 -i 2 -i 8 -+u -f $TEMP_FILE"
NUM_EXPERIMENTS=10

function log {
    echo [ `date '+%d/%m/%Y %X'` ] $1
}

if [ ! -d $TEMP_MOUNT ]; then
    mkdir $TEMP_MOUNT
fi

if [ ! -d $LOG_DIR ]; then
    exit 1
fi

for fs in ext4 reiserfs xfs; do
    for bs in 4096 1024; do
        if [ $fs = "xfs" ]; then
            MKFS_PARAM="-f -b size=$bs"
        fi
        if [ $fs = "ext4" ]; then
            MKFS_PARAM="-b $bs"
        fi
        if [ $fs = "reiserfs" ]; then
            if [ $bs = 1024 ]; then
                continue
            fi
            MKFS_PARAM="-f -b $bs"
        fi

        log "Formatting $TEMP_DEVICE with fs:$fs bs:$bs"
        mkfs.$fs $MKFS_PARAM $TEMP_DEVICE &> /tmp/trace
        if [ $? != 0 ]; then
            exit 1
        fi

        log "Mounting $TEMP_MOUNT"
        mount $TEMP_DEVICE $TEMP_MOUNT &> /tmp/trace
        if [ $? != 0 ]; then
            exit 1
        fi

        for size in 64k 64m; do
            for((i=0; i<$NUM_EXPERIMENTS; i++)); do
                log "Executing test for fs:$fs bs:$bs fsize:$size exp:$i"

                $IOZONE $IOZONE_PARAMS -s $size > $LOG_DIR/experiment_${fs}_${bs}_${size}_${i}.txt
                if [ $? != 0 ]; then
                    exit 1
                fi
            done
        done

        log "Umounting $TEMP_MOUNT"
        umount $TEMP_MOUNT &> /tmp/trace
        if [ $? != 0 ]; then
            exit 1
        fi
    done
done
