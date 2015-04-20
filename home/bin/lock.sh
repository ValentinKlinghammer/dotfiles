#!/bin/bash
#depends on scrot, imagemagick, i3lock
TMPBG=$HOME/tmp/screen.png
ICON=$HOME/bin/icons/lock.png

scrot $TMPBG
# Pixelate effect by scaling down and up again
convert $TMPBG -scale 10% -scale 1000% $TMPBG
# Slight black overlay
convert $TMPBG -fill black -colorize 25% $TMPBG
# Add lock icon to center of screen
[[ -f $ICON ]] && convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

# Finally, execute lock
i3lock -u -n -i $TMPBG
