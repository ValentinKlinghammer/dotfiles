#!/bin/bash
username=vk
userhome=/home/$username
export XAUTHORITY="$userhome/.Xauthority"
export DISPLAY=":0"

lock() {
  sh -c "$userhome/bin/lock.sh"
}

grep -q closed /proc/acpi/button/lid/LID/state
if [ $? = 0 ]
  lock
  sudo pm-suspend-hybrid
then
  lock
  sudo pm-suspend-hybrid
fi
