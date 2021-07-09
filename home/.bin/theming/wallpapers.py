#!/usr/bin/env python

"""
Download a random wallpaper from unsplash or choose one in ~/wallpapers
"""
import hashlib
from lib.logger import error, info
from lib.checks import check_inet
from os.path import exists
from os import environ, listdir, system, mkdir
from shutil import copyfile
from random import randint
import urllib

def set_wall(wallpath="/tmp/wallpaper.png"):
    system(f"feh --bg-fill {wallpath}")

if not check_inet():
    wallspath = f"{environ['HOME']}/wallpapers"
    unsplashpath = f"{environ['HOME']}/unsplash-wallpapers"
    if not exists(wallspath) and not exists(unsplashpath):
        error("Can't find wallpapers path", "WALLPAPERS")
        exit(1)
    walls = []
    if exists(wallspath):
        for wall in listdir(wallspath):
            walls.append(f"{wallspath}/{wall}")
    if exists(unsplashpath):
        for wall in listdir(unsplashpath):
            walls.append(f"{unsplashpath}/{wall}")
            
    try:
        finalwall = walls[randint(0, len(walls))]
    except:
        exit(1)
    print(walls)
    if not exists(finalwall):
        error("Wallpaper not found, WTF", "WALLPAPERS")
        exit(1)
    
    info(f"Setting wallpaper to {finalwall}", "WALLPAPERS")
    # Use FEH to set the wallpaper
    set_wall(finalwall)
else:
    dest = "/tmp/wallpaper-"
    try:
        with urllib.request.urlopen('http://source.unsplash.com/1920x1080/?wallpaper') as res:
            resbytes = res.read()
            wallhash = hashlib.sha256(resbytes).hexdigest()
            dest += f"{wallhash}.png"
            open(dest, 'wb').write(resbytes)
    except:
        error("Can't download wallpaper from unsplash!", "WALLPAPERS")
        exit(1)
    
    info(f"Settings wallpaper from unsplash: {dest}", "WALLPAPERS")

    set_wall(dest)
    walldestpath = f"{environ['HOME']}/unsplash-wallpapers"
    if not exists(walldestpath):
        mkdir(walldestpath)        

    copyfile(dest, f"{walldestpath}/{wallhash}.png")