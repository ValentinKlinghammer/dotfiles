    # Highlight with 'moria' theme to terminal, and suppress errors
    highlight $1 -s moria -O xterm256 2> /dev/null

    if (($? != 0)); then # If the command had errors
        cat $1 # Just cat the file out instead
    fi
