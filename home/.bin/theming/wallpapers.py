#!/usr/bin/env python

"""
Download a random wallpaper from unsplash or choose one in ~/wallpapers
"""
import hashlib
import sys
from os.path import dirname, realpath
dotbinpath = realpath(f"{dirname(__file__)}/..")
sys.path.append(dotbinpath)  # Because VSCode is stupid
sys.path.append(f"{dotbinpath}/lib")
from lib.logger import error, info
from lib.checks import check_inet
from lib.util import is_wayland
from os.path import exists
from os import environ, listdir, system, mkdir, fork
from subprocess import DEVNULL, Popen
from shutil import copyfile
from random import randint
import urllib
from psutil import process_iter

def set_wall(wallpath="/tmp/wallpaper.png"):
    if is_wayland():
        if fork() == 0:
            for process in process_iter():
                if process.name() == "swaybg":
                    try:
                        process.kill()
                    except:
                        error("Can't kill swaybg!")
            Popen(["swaybg", "-i", wallpath, "-m", "fill"], stdout=DEVNULL, stderr=DEVNULL)
    else:
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
        system("notify-send -u critical Wallpaper.py \"Can\\'t reach unsplash\"")
        exit(1)
    info(f"Settings wallpaper from unsplash: {dest}", "WALLPAPERS")

    set_wall(dest)
    walldestpath = f"{environ['HOME']}/unsplash-wallpapers"
    if not exists(walldestpath):
        mkdir(walldestpath)

    if len(listdir(walldestpath)) >= 250:
        error(
            f"Found more than 250 wallpapers in {walldestpath}", "WALLPAPERS")
    copyfile(dest, f"{walldestpath}/{wallhash}.png")
