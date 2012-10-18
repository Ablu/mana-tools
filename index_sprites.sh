#!/bin/bash

[ $# -ne 6 ] && {
    echo "Usage: `basename $0` <source> <number of sprites in x-dir> <number of sprites in y-dir> <sprite width> <sprite height> <output>"
    exit 65
}

ID=0
ARGS=""
for y in `seq 0 $(($3 - 1))`
do
    for x in `seq 0 $(($2 - 1))`
    do
        echo $(($x * $4)) $(($y * $5)) $ID
        ARGS="$ARGS -annotate +$(($x * $4))+$(($y * $5)) $ID"
        ID=$(($ID + 1))
    done
done
convert "$1" -gravity northwest -fill red$ARGS $6
