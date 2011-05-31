#!/bin/bash

TEMP_DEVICE=/dev/sda9
TEMP_FILE=/tmp/test_fs/temp_file
IOZONE=/usr/bin/iozone
IOZONE_PARAMS="-Rb -s 512 -r4k -i 0 -i 1 -i 2 -i 8 -f $TEMP_FILE"

for fs in ext4 reiserfs xfs; do
    for bs in 4k 1k; do
        echo mkfs.$fs -b $bs $TEMP_DEVICE
        echo mount $TEMP_DEVICE $TEMP_FILE
        for size in 512 1024k; do
            for((i=0; i<10; i++)); do
                echo $IOZONE $IOZONE_PARAMS -s $size
            done
        done
        echo echo 3 /proc/sys/vm/drop_caches
        echo echo 0 /proc/sys/vm/drop_caches
        echo umount $TEMP_FILE
    done
done
