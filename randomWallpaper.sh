#!/bin/bash

# configuration
wallpaperPath="$HOME/Pictures/Wallpapers"
minWidth=1920
minHeight=1080

scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function main() {
  
  # the path of a random picture
  choice=$(fd '(jpeg|webp|png|jpg)' $wallpaperPath | shuf | head -n 1)

  width=$(identify -format "%w" $choice)
  height=$(identify -format "%h" $choice)

  # if resolution of picture is agove 1080p, then will set wallpaper
    # otherwise will call main funtion again and try with another choice
  if [ $width -ge $minWidth ] && [ $height -ge $minHeight ]
  then
    $scriptDirectory/setWallpaper.sh $choice

    echo -e "Wallpaper is\n $choice"
    notify-send "Wallpaper" "$choice"
    exit 0
  else 
    # call function again to find a new compatible picture
    main
  fi

}

main
