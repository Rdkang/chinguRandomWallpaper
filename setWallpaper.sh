#!/bin/sh

# This script does the following:
#	Run by itself, set the wallpaper (at X start).
#	If given a file, set that as the new wallpaper.
#	If given a directory, choose random file in it.

# location of link to wallpaper link.
wallpaperLocation="$HOME/.local/share/wallpaper"

trueLocation="$(readlink -f "$1")" &&
case "$(file --mime-type -b "$trueLocation")" in
	image/* ) ln -sf "$(readlink -f "$1")" "$wallpaperLocation" ;;
	inode/directory ) ln -sf "$(find "$trueLocation" -iregex '.*.\(jpg\|jpeg\|png\|gif\)' -type f | shuf -n 1)" "$wallpaperLocation" ;;
	*) notify-send ":(" "Not a valid image." ; exit 1;;
esac

xwallpaper --zoom "$wallpaperLocation"
