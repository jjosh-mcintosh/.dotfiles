#!/bin/bash
#source $(dirname $0)/config.sh
source $HOME/bin/config.sh
XPOS="1"
YPOS='0'
WIDTH="500"
LINES="30"
FONT="-*-profont-*-*-*-*-10-*-*-*-*-*-*-*"
SLEEP=15


date=$(date --rfc-3339=date)
dmesg=$(dmesg | tail -n25 | cut -b16-)
journal=$(journalctl --no-pager -q --since=$date | sed -e '/kernel:/d' | tail -n25)

(echo " ^fg($highlight)Logs"; echo "^fg($highlight)KERNEL "; echo " "; echo \
"^fg()$dmesg"; echo " "; echo "^fg($highlight)USERLAND "; echo " "; echo \
"$journal"; sleep $SLEEP) | dzen2 -fg $foreground -bg  $background -fn $FONT -x \
$XPOS -y $YPOS -w $WIDTH -l $LINES -e \
'onstart=uncollapse,hide,scrollhome;button1=exit;button3=exit;button4=scrollup;button5=scrolldown;'
