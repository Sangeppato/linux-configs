#!/bin/bash

set -e

while :
do
	cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
	sleep 1
done
