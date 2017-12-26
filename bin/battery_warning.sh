#!/bin/bash

function checkBattery() {
  PERCENTAGE=`echo $BATTINFO | awk -F',' '{ print $2 }' | sed -e 's/%//' | sed -e 's/ *//'`
  if [[ $PERCENTAGE < 20 ]]; then
    DISPLAY=:0.0 /usr/bin/notify-send "Battery: $PERCENTAGE%, connect charger"
  fi
}

while true
do
  BATTINFO=`acpi -b | grep Discharging`
  if [[ $? == 0 ]]; then
    checkBattery
  fi
  sleep 60
done
