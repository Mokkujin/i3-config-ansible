#!/bin/bash
# $BLOCK_INSTANCE
# $BLOCK_NAME
# $BLOCK_BUTTON
# 1 = Left
# 2 = Middle
# 3 = Right
# 4 = Scroll Up
# 5 = Scroll Down
# 6 = Custom
# 7 = Custom
# 8 = Upper Thumb
# 9 = Lower Thumb
# 10+ = Custom
# $BLOCK_X & $BLOCK_Y

_own_path=$(dirname $(readlink -f ${0}))
_adapter=$BLOCK_INSTANCE

_local_ip=$(ip addr show ${_adapter} | grep -w "inet" | awk '{print $2}' | awk -F '/' '{print $1}')

case $BLOCK_BUTTON in
    1)
        gnome-terminal -e "bmon"
        ;;
    3)
        gnome-terminal -e "bash ${_own_path}/whois.sh"
        ;;
esac

echo ${_local_ip}