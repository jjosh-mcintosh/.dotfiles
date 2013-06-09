#!/usr/bin/env bash

: "${wm:=$HOME/bin/monsterwm}"
: "${ff:="/tmp/$RANDOM.monsterwm.fifo"}"

tags=(' ^i(/usr/share/icons/stlarch_icons/dice1.xbm) ' ' ^i(/usr/share/icons/stlarch_icons/dice2.xbm) ' 
      ' ^i(/usr/share/icons/stlarch_icons/dice3.xbm) ' ' ^i(/usr/share/icons/stlarch_icons/dice4.xbm) ')

layouts=('^i(/usr/share/icons/stlarch_icons/tile.xbm)'
         '^i(/usr/share/icons/stlarch_icons/monocle.xbm)'
         '^i(/usr/share/icons/stlarch_icons/bstack.xbm)'
         '^i(/usr/share/icons/stlarch_icons/grid.xbm)')

#trayer --edge top --align right --SetPartialStrut true --SetDockType true --heighttype pixel \
#    --height 14 --widthtype pixel --width 130 &
conky | dzen2 -h 14 -y 0 -x 820 -w 500 -ta r -e -p -bg '#210431' -fg '#bbbbbb' -fn "-*-profont-*-*-*-*-12-*-*-*-*-*-*-*" &

# Check if it's a pipe, otherwise create it
[[ -p $ff ]] || mkfifo -m 600 "$ff"

while read -t 60 -r wmout || true; do
    desktops=( $(cut -d"|" -f1 <<< "$wmout") )
    title="$(cut -d"|" -f2- <<< "$wmout")"

    if [[ "${desktops[@]}" =~ ^(([[:digit:]]+:)+[[:digit:]]+ ?)+$ ]]; then
        unset tmp

        for desktop in "${desktops[@]}"; do
            IFS=':' read -r d w m c u <<< "$desktop"

            # Tags labels
            label="^ca(1,xdotool key Super_L+$(($d+1)))${tags[$d]}^ca()"

            # Is this the current desktop ? save the layout
            ((c)) && fg="#fefefe" bg="#7B1052" && layout="${layouts[$m]}" \
                  || fg="#b3b3b3" bg=""

            # Has windows ?
            ((w)) && fg="#F8EF2A"

            # Urgent windows ?
            ((u)) && fg="#ef2929"

            tmp+="^fg($fg)^bg($bg) $label ^bg()^fg()"
        done
    fi

    # Merge the clients indications, the tile and the info
    echo "^ca(1,/home/joshua/bin/dzen_log.sh)^fg(#1892CE)  \
^i(/usr/share/icons/stlarch_icons/arch1.xbm) ^ca()^fg()^bg()| $tmp  \
$layout  $title"
done < "$ff" | dzen2 -w 520 -h 14  -y 0 -ta l -e -p -bg '#210431' -fg '#bbbbbb' -fn "-*-profont-*-*-*-*-12-*-*-*-*-*-*-*" &

while :; do "$wm" || break; done | tee -a "$ff"
#$wm > "$ff"
