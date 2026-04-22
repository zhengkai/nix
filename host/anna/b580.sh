#! /usr/bin/env bash

set -x

# 确认当前状态
lspci -v -s 03:00.0 | grep "Kernel driver"
lspci -v -s 04:00.0 | grep "Kernel driver"

# 解绑 B580 GPU (xe)
echo "0000:03:00.0" | sudo tee /sys/bus/pci/devices/0000:03:00.0/driver/unbind

# 解绑 B580 Audio (snd_hda_intel)
echo "0000:04:00.0" | sudo tee /sys/bus/pci/devices/0000:04:00.0/driver/unbind

# 绑定到 vfio-pci
echo "8086 e20b" | sudo tee /sys/bus/pci/drivers/vfio-pci/new_id
echo "8086 e2f7" | sudo tee /sys/bus/pci/drivers/vfio-pci/new_id
