"""
Functions related to material you dynamic theming
"""


from posix import listdir
from posixpath import dirname, realpath
from shutil import copyfile
from subprocess import DEVNULL, Popen
from lib.config import get_config
from os.path import exists

from lib.logger import error, info


def set_palette(path: str):
    """
    Generate/set material you palette for {path}
    """
    config = get_config()
    theme = config.get("theme")
    dest = f"{path}_{theme}.json"
    # Generate color palette using materugen
    if not exists(dest):
        try:
            Popen(['materugen', path, dest, theme], stderr=DEVNULL, stdout=DEVNULL).wait()
        except:
            error("Can't generate palette!", "MU")

    copyfile(dest, "/tmp/mu_palette.json")
    info("Generated /tmp/mu_palette.json", "MU")


def load_themes_d():
    """
    Loads all scripts in themes.d
    """
    basepath = f"{realpath(dirname(__file__))}/themes.d"
    if exists(basepath):
        for file in listdir(basepath):
            info(f"Launching {file}", "THEMED")
            # Just spawn the files, don't care about interpreter and such
            Popen([f"{basepath}/{file}", "/tmp/mu_palette.json"], stdout=DEVNULL, stderr=DEVNULL)

