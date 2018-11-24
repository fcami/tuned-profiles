#!/bin/sh

. /usr/lib/tuned/functions

start() {
    ethtool -G enp1s0 rx 4096 tx 4096
    ethtool -G enp2s0 rx 4096 tx 4096
    ethtool -G enp3s0 rx 4096 tx 4096
    ethtool -G enp4s0 rx 4096 tx 4096
    thp_path=/sys/kernel/mm/transparent_hugepage
    echo 'never' > ${thp_path}/enabled
    echo 'never' > ${thp_path}/defrag
    echo 0  > ${thp_path}/khugepaged/defrag
    cpupower frequency-set -u 500000 -r
    [ "$USB_AUTOSUSPEND" = 1i ] && enable_usb_autosuspend
    enable_wifi_powersave
    return 0
}

stop() {
    [ "$USB_AUTOSUSPEND" = 1 ] && disable_usb_autosuspend
    disable_wifi_powersave
    return 0
}

process $@
