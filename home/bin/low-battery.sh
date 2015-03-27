#!/bin/bash

BATTINFO=`acpi -b`
REMAINING=`echo $BATTINFO | cut -f 5 -d " " | sed 's/:..$//'`
PERCENTAGE=`echo $BATTINFO | cut -f 4 -d " " | sed 's/,//'`

if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send 'Warning Low Battery' "<b>$PERCENTAGE</b>\n$REMAINING remaining"
fi
