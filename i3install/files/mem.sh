#!/bin/bash 
_icon='<span foreground="#929292"></span> '
_ram=$(free --kilo | grep "^Speicher:" | awk '{print $2}')
_ram_free=$(free --kilo | grep "^Speicher:" | awk '{print $4}')
_ram_used=$(free --kilo | grep "^Speicher:" | awk '{print $3}')
_p1=$(echo "$_ram/100" | bc )
_ram_prozent=$(echo "$_ram_used / ${_p1}" | bc)

case $BLOCK_BUTTON in
    3)
        gnome-terminal -e "htop"
        ;;
esac


if [ -z "$1" ]; then
    echo -e "Installed ${_ram} Used ${_ram_used} Free ${_ram_free}"
else
    case "$1" in
        "-i" )
            echo -e "${_ram}"
            ;;
        "-u" )
            echo -e "${_ram_used}"
            ;;
        "-f" )
            echo -e "${_ram_free}"
            ;;
        "-p" )
            if [ ${_ram_prozent} -le 60 ]; then
                echo ${_icon}' <span foreground="#3a7634">'${_ram_prozent} '%</span>'
            elif [ ${_ram_prozent} -gt 60 && ${_ram_prozent} -le 85 ]; then
                echo ${_icon}' <span foreground="#9b9851">'${_ram_prozent} '%</span>'
            else
                echo ${_icon}' <span foreground="#8c5257">'${_ram_prozent} '%</span>'
            fi
            ;;
    esac
fi

unset _p1
unset _icon
unset _ram
unset _ram_free
unset _ram_used
unset _ram_prozent