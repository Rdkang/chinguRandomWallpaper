#!/bin/bash


scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $scriptDirectory/config.sh

function main() {
  
  # the path of a random picture
  choice=$(find $wallpaperPath -type f -regex ".*\.\(jpg\|gif\|png\|jpeg\)" | shuf | head -n 1)

  width=$(identify -format "%w" $choice)
  height=$(identify -format "%h" $choice)

  # if resolution of picture is agove 1080p, then will set wallpaper
    # otherwise will call main funtion again and try with another choice
  if [ $width -ge $minWidth ] && [ $height -ge $minHeight ]
  then
    feh --bg-scale $choice

    echo -e "Wallpaper is\n $choice"
    notify-send "Wallpaper" "$choice"
    exit 0
  else 
    # call function again to find a new compatible picture
    main
  fi

}

main
