#!/bin/sh

. /usr/lib/tuned/functions

start() {
    cpupower frequency-set -u 2000000
    echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
    [ "$USB_AUTOSUSPEND" = 1 ] && enable_usb_autosuspend
    enable_wifi_powersave
    return 0
}

stop() {
    [ "$USB_AUTOSUSPEND" = 1 ] && disable_usb_autosuspend
    disable_wifi_powersave
    return 0
}

process $@
