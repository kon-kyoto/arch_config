#!/bin/bash
# Monitor keyboard layout changes

PREV_LAYOUT=""

while true; do
    CURRENT_LAYOUT=$(~/.config/waybar/scripts/keyboard-layout.sh display)
    
    if [ "$CURRENT_LAYOUT" != "$PREV_LAYOUT" ]; then
        # Update cache
        echo "$CURRENT_LAYOUT" > /tmp/keyboard_layout
        
        # Send signal to waybar
        pkill -RTMIN+8 waybar 2>/dev/null
        
        PREV_LAYOUT="$CURRENT_LAYOUT"
    fi
    
    sleep 1
done
