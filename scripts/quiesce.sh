#!/usr/bin/env bash

PSTATE_DIR=/sys/devices/system/cpu/intel_pstate
NO_TURBO_FILE=${PSTATE_DIR}/no_turbo

echo 1 | sudo tee ${NO_TURBO_FILE} > /dev/null

sudo sysctl kernel.numa_balancing=0

sudo sysctl kernel.perf_event_paranoid=-1

MAX_FREQ=$(sudo cpufreq-info -l | cut -d \  -f2)

for ((i=0;i<$(nproc);i++)); do
    sudo cpufreq-set -g performance -c ${i} -u ${MAX_FREQ}
done