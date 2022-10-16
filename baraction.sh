#!/bin/bash
# baraction.sh for spectrwm status bar

## BATTERY 

bat() { 
	per_charge=$(cat "/sys/class/power_supply/BAT0/capacity")
echo -e "BAT: $per_charge%"

}


## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
  mem=`echo $(free -h) | awk -F" " '{ print $9 }'`
  echo -e "MEM: $mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
    vol=`pactl get-sink-volume @DEFAULT_SINK@ | awk -F"/" '{ print $2 }' |tr -d ' '`
    echo -e "VOL: $vol"
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
	echo " $(cpu) | $(mem) | $(vol) | $(bat) |"
	sleep $SLEEP_SEC
done


