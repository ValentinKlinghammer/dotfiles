#!/bin/bash
if [ -r ~/.cache/Xdbus  ]; then
  . ~/.cache/Xdbus
fi

IFS=';' read updates security_updates < <(/usr/lib/update-notifier/apt-check 2>&1)


if [[ $updates > 0 ]] ; then
    MESSAGE="$updates packages have updates"

    if [[ $security_updates > 0 ]] ; then
        MESSAGE="$MESSAGE\n$security_updates are security updates"
    fi

    DISPLAY=:0.0 notify-send 'Updates Available' "$MESSAGE" -t 0
fi
