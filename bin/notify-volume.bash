#!/bin/bash
#Volume script for dunst and libnotify
if [ $1 == "UP" ]
then
	amixer -D pulse sset Master 5%+ unmute
elif [ $1 == "DOWN" ]
then
	amixer -D pulse sset Master 5%- unmute
elif [ $1 == "MUTE" ]
then
	amixer -q set Master toggle
fi
LEFT=$(amixer get Master | grep Left | egrep -o "[0-9]+%")
RIGHT=$(amixer get Master | grep Right | egrep -o "[0-9]+%")
MUTED=$(amixer get Master | grep Left)
if [[ $MUTED == *off* ]]
then
	volnoti-show
else
	volnoti-show $LEFT
fi
