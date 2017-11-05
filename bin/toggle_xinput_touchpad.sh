#!/usr/bin/env bash

device=$(xinput | grep -i touchpad | awk -F'\t' '{ print $2}' | cut -d '=' -f 2)
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
      xinput --disable $device
else
      xinput --enable $device
fi
