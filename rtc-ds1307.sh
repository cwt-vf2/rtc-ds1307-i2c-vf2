#!/bin/bash

source /etc/rtc-ds1307.conf

if [ "$1" == "boot" ]; then
	i2cget -y ${I2C_BUS} ${CHIP_ADDRESS} > /dev/null
	if [ $? -eq 0 ]; then
		modprobe rtc_ds1307
		echo ds1307 ${CHIP_ADDRESS} > /sys/class/i2c-adapter/i2c-${I2C_BUS}/new_device
		while [ ! -c "/dev/rtc1" ]; do
			sleep 0.1
		done
		# Set clock from the external RTC
		/usr/bin/hwclock --hctosys --rtc=/dev/rtc1
		# Set the internal RTC clock
		/usr/bin/hwclock --systohc --rtc=/dev/rtc0
	fi
elif [ "$1" == "shutdown" ]; then
	if [ -c "/dev/rtc1" ]; then
		# Set the external RTC clock
		/usr/bin/hwclock --systohc --rtc=/dev/rtc1
	fi
fi

