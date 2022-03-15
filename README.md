# chinguRandomWallpaper

blazing fast and simple/extensible, script to set the wallpaper 🌄

##### origin of the name

> **chingu** means **friend** in korean

![spicyScreenshot](spicyScreenshot.png)

## Usage

can use a program such as [xbindkeys](https://wiki.archlinux.org/title/Xbindkeys) to run this script
E.g.

```bash
"~/Documents/chinguRandomWallpaper/randomWallpaper.sh"
alt+w
```

### wallpaper at boot

to have the wallpaper be set after booting add `~/.fehbg &` to your `.xinitrc` or using desktop environments autostart

## Installation

1. clone or download the files

   `$ git clone https://github.com/Rdkang/chinguRandomWallpaper.git`

2. run the file called **randomWallpaper.sh**

   `$ ./randomWallpaper.sh`

3. thats it! :)

## Requirements

- any modern linux distro
- feh
- imagemagick
- find
