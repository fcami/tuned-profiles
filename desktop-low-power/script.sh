#!/bin/sh

. /usr/lib/tuned/functions

start() {
  cpupower frequency-set -d 2.8G
  cpupower frequency-set -u 3.2G
  echo 1 |tee /sys/devices/system/cpu/intel_pstate/no_turbo
  return 0
}

stop() {
  return 0
}

process $@

