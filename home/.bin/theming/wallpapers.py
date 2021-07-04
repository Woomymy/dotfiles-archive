#!/usr/bin/env python

"""
Download a random wallpaper from unsplash or choose one in ~/wallpapers
"""
from lib.logger import error, info
from lib.checks import check_inet
from os.path import exists
from os import environ, listdir, system
from random import randint

if check_inet():
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
    system(f"feh --bg-fill {wall}")