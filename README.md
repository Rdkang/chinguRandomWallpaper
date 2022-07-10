# chinguRandomWallpaper

blazing fast and simple/extensible, script to set the wallpaper 🌄

##### origin of the name

> **chingu** means **friend** in korean

![spicyScreenshot](spicyScreenshot.png)

## Features
- uses dmenu to show options
   - set random wallpaper
   - favorite wallpapers for easier access
   - fuzy search through wallpapers
   - open current wallpaper in image viewer
   - open current wallpaper in file manager
   - trash the current wallpaper
- the main feature is to only wallpaper that are larger than a certain [dimension](https://github.com/Rdkang/chinguRandomWallpaper/blob/main/config.sh?#L6)


## Usage

can use a program such as [xbindkeys](https://wiki.archlinux.org/title/Xbindkeys) or [sxhkd](https://wiki.archlinux.org/title/Sxhkd)(simple x hot keydaemon) to run this script
E.g for *sxhkd*.

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

#### Configuration
edit the [config.sh](https://github.com/Rdkang/chinguRandomWallpaper/blob/main/config.sh) file


## Requirements

- any modern linux distro
- xwallpaper
- imagemagick
- fd
- [rofi](https://wiki.archlinux.org/title/rofi) or [dmenu](https://wiki.archlinux.org/title/dmenu)
- [trash-cli](https://github.com/andreafrancia/trash-cli) (optional)

## Alternatives

i have now realised can use [feh](https://wiki.archlinux.org/title/Feh), but miss out on one feature from this program.
in this program can specify the minium size of a picture

## To Do

- check to see if dmenu installed or rofi
- be able to use the fuzzy through dmenu
