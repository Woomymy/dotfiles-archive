#!/usr/bin/env python

"""
Download a random wallpaper from unsplash or choose one in ~/wallpapers
"""

from lib.logger import error, info
from lib.checks import check_inet
from os.path import exists
from os import environ, listdir, system
from random import randint
import urllib

def set_wall(wallpath="/tmp/wallpaper.png"):
    system(f"feh --bg-fill {wallpath}")

if not check_inet():
    wallspath = f"{environ['HOME']}/wallpapers"
    if not exists(wallspath):
        error("Can't find wallpapers path", "WALLPAPERS")
    walls = listdir(wallspath)
    try:
        wall = f"{wallspath}/{walls[randint(0, len(walls))]}"
    except:
        exit(1)
    if not exists(wall):
        error("Wallpaper not found, WTF", "WALLPAPERS")
        exit(1)
    
    info(f"Setting wallpaper to {wall}", "WALLPAPERS")
    # Use FEH to set the wallpaper
    set_wall(wall)
else:
    try:
        with urllib.request.urlopen('http://source.unsplash.com/1920x1080/?wallpaper') as res:
            open('/tmp/wallpaper.png', 'wb').write(res.read())
    except:
        error("Can't download wallpaper from unsplash!", "WALLPAPERS")
        exit(1)
    
    info(f"Settings wallpaper from unsplash: /tmp/wallpaper.png", "WALLPAPERS")

    set_wall("/tmp/wallpaper.png")
