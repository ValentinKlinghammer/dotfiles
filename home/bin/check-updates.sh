#!/bin/bash

IFS=';' read updates security_updates < <(/usr/lib/update-notifier/apt-check 2>&1)


if [[ $updates > 0 ]] ; then
    MESSAGE="$updates packages have updates"

    if [[ $security_updates > 0 ]] ; then
        MESSAGE="$MESSAGE\n$security_updates are security updates"
    fi

    echo $MESSAGE
    DISPLAY=:0.0 /usr/bin/notify-send 'Updates Available' "$MESSAGE"
fi
