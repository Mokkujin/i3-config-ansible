#!/bin/bash
function log_screen() {
    /usr/bin/i3lock -i ~/.config/i3/wall_lock.png -t	
}

case "${1}" in
    lock)
        log_screen
        ;;
    logout)
        i3-msg exit
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "usage ${0} [lock|logout|reboot|shutdown]"
        exit 2
esac
exit 0