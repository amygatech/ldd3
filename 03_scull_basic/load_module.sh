#! /bin/sh
module="scull"
device="scull"
mode="666"
#group=0

load() {
	echo "load scull module"
	# invoke insmod with all arguments we got
    insmod ./$module.ko $* || exit 1

	# remove stale node
    rm -f /dev/${device}[0-2]

    major=$(awk -v device="$device" '$2==device {print $1}' /proc/devices)
    mknod /dev/${device}0 c $major 0
    mknod /dev/${device}1 c $major 1
    mknod /dev/${device}2 c $major 2

	# give appropriate group/permissions, and change the group.
	group=0
    chgrp $group /dev/$device[0-2]
    chmod $mode /dev/$device[0-2]
}

unload() {
	echo "---unload scull module----"
	#remove stale nodes
    rm -f /dev/${device}[0-2]
    # invoke rmmod module
    rmmod $module || exit 1
}

arg=${1:-"load"}
case $arg in
    load)
        load ;;
    unload)
        unload ;;
    reload)
        ( unload )
        load
        ;;
    *)
        echo "Usage: $0 {load | unload | reload}"
        echo "Default is load"
        exit 1
        ;;
esac

