# chinguRandomWallpaper

blazing fast and simple/extensible, script to set the wallpaper 🌄

##### origin of the name

> **chingu** means **friend** in korean

![spicyScreenshot](spicyScreenshot.png)

## Usage

can use a program such as [xbindkeys](https://wiki.archlinux.org/title/Xbindkeys) to run this script
E.g.

```bash
alt + w
"~/Documents/chinguRandomWallpaper/randomWallpaper.sh"

alt + shift + w
"~/Documents/chinguRandomWallpaper/randomWallpaper.sh random"
```

### wallpaper at boot

to have the wallpaper be set after booting add `{path to script}/randomWallpaper.sh reapply` to your `.xinitrc` or using desktop environments autostart

## Installation

1. clone or download the files

   `$ git clone https://github.com/Rdkang/chinguRandomWallpaper.git`

2. run the file called **randomWallpaper.sh**

   `$ ./randomWallpaper.sh`

3. thats it! :)

## Requirements

- any modern linux distro
- xwallpaper
- imagemagick
- fd

## Alternatives

i have now realised can use [feh](https://wiki.archlinux.org/title/Feh), but miss out on one feature from this program.
in this program can specify the minium size of a picture

## To Do

- check to see if dmenu installed or rofi
- be able to use the fuzzy through dmenu
