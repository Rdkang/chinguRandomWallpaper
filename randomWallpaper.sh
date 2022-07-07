#!/bin/bash
#  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗
# ██╔════╝██║  ██║██║████╗  ██║██╔════╝ ██║   ██║
# ██║     ███████║██║██╔██╗ ██║██║  ███╗██║   ██║
# ██║     ██╔══██║██║██║╚██╗██║██║   ██║██║   ██║
# ╚██████╗██║  ██║██║██║ ╚████║╚██████╔╝╚██████╔╝
#  ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝

## possible options
# - random
# - favorite
# - reapply
# - fuzzy
# - sxiv
# - fuzzyFavorite
# - remove
# - file manager

scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $scriptDirectory/config.sh

# if no arguments passed will prompt for options in dmenu
if [[ -z "$*" ]]; then
  wallpaper_name=$(readlink $scriptDirectory/wallpaper | xargs -i basename {})
  wallpaper_path=$( readlink $scriptDirectory/wallpaper | xargs -i dirname {} | xargs -i basename {})
  notify-send --icon=terminal "Wallpaper:" "$wallpaper_name in $wallpaper_path"
  option=$(echo -e "random\nfavorite\nreapply\nsxiv\nfuzzy\nfuzzyFavorite\nremove\nfiles" | rofi -i -dmenu)
else
# else first argument is used
  option=$1
fi

function setWallpaper() {
    choice=$1

    width=$(identify -format "%w" $choice)
    height=$(identify -format "%h" $choice)


    # if resolution of picture is agove 1080p, then will set wallpaper
      # otherwise will call main funtion again and try with another choice
    if [ $width -ge $minWidth ] && [ $height -ge $minHeight ]
    then
      ln -sf $choice $scriptDirectory/wallpaper
      xwallpaper --zoom $scriptDirectory/wallpaper

      echo -e "Wallpaper is\n $choice"
      echo -e "$choice" >> $scriptDirectory/wallpaper.log
      exit 0
    else 
      # call function again to find a new compatible picture
      echo "$choice not large than wanted :("
      chooseRandom
    fi

}

if [[ $option = "random" ]]; then
  function chooseRandom() {
    
    # the path of a random picture
    choice=$(fd "(jpg|gif|png|jpeg)" $wallpaperPath -E '*samDoesArt' | shuf | head -n 1)
    setWallpaper $choice
  }

  chooseRandom

# if favorite flag, then will put the file to a favorites file
elif [[ $option = "favorite" ]]; then
  currentWallpaper=$(readlink $scriptDirectory/wallpaper)
  echo "Adding Wallpaper - $currentWallpaper to favorites"
  notify-send "💚 ChinguRandomWallpaper" "$currentWallpaper to favorites"
  echo -e "$currentWallpaper" >> $scriptDirectory/favorites.log

elif [[ $option = "fuzzyFavorite" ]]; then
  choice=$(cat $scriptDirectory/favorites.log | shuf | sed "s#$wallpaperPath/##" | fzf --height=100 --info=default --preview='tiv -w 92 -h 16 {}' --header='choose wallpaper here ;)')
  setWallpaper "$wallpaperPath/$choice"

elif [[ $option = "reapply" ]] || [[ $1 = "reapply" ]]; then
  echo "setting previous wallpaper"
  notify-send "💚 ChinguRandomWallpaper" "setting previous wallpaper"
  xwallpaper --zoom $scriptDirectory/wallpaper

elif [[ $option = "fuzzy" ]]; then
  choice=$(cd $wallpaperPath && fd '\.jpg$|\.png' | shuf | fzf --height=100 --info=default --preview='tiv -w 92 -h 16 {}' --header='choose wallpaper here ;)' | rofi -dmenu)
  setWallpaper "$wallpaperPath/$choice"

elif [[ $option = "sxiv" ]]; then
  choice=$(cd $wallpaperPath && fd '\.jpg$|\.png' | shuf | head -n 30 | nsxiv -to - )
  setWallpaper "$wallpaperPath/$choice"

elif [[ $option = "remove" ]]; then
  to_remove=$(tail $scriptDirectory/wallpaper.log -n 1)
  mv -v $to_remove /tmp && echo "sucessfully moved" ; notify-send "removed $to_remove"

elif [[ $option = "files" ]]; then
  choice=$(readlink $scriptDirectory/wallpaper)
  $file_manager $choice


else
  echo "no valid option chosen :("
fi
