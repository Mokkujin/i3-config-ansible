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

function show_help() {
    echo -e "${0} usage:"
    echo -e " -n : The Name of the give timezone or city , will show in bar"
    echo -e " -t : The Timezone (+ or - allowed)"
    echo -e " -o : The Offset (hour)"
    echo -e " -h : Show this help"
    echo -e "-----------------------------"
    echo -e "example to show the time for austin"
    echo -e "${0} -n 'Austin' -t '-' -o '7'"
    exit 1
}

while getopts n:t:o:h opts; do
    case ${opts} in
        n) _name=${OPTARG} ;;
        t) _tz=${OPTARG} ;;
        o) _offset=${OPTARG} ;;
        h) show_help ;;
    esac
done

if [ -z ${_name} ] || [ -z ${_tz} ] || [ -z ${_offset} ]; then
    show_help
else
    _current_time=$(date '+%H:%M' -d ${_tz}${_offset}hour)
fi

case $BLOCK_BUTTON in
    1)
        # anzeigen der zeiteinstellung
        not_msg="Current Timezone in ${_name}<br> ${_tz}${_offset}hour"
        notify-send "${not_msg}"
        ;;
esac

_notify_message="${_name} ${_current_time}"

echo "${_notify_message}"