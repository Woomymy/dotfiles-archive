"""
Functions related to material you dynamic theming
"""


from posix import listdir
from posixpath import dirname, realpath
from shutil import copyfile
from subprocess import DEVNULL, Popen, check_output
from lib.config import get_config
from os.path import exists
from json import dumps, loads

from lib.logger import error, info


def gen_256_pal(path: str):
    """
    Generate a 256 colors palette based on mu_palette by "converting" HEX colors to color indexes
    """
    with open("/tmp/mu_palette.json", 'r') as full_palette:
        palette = loads(full_palette.read())
        for color in palette.keys():
            # The "type" key is an extra key that just contains theme type name
            # This shouldn't be converted
            if color == "type": continue
            try:
                palette[color] = check_output(['hexto256', palette[color].replace("#", "")]).decode("UTF-8").strip()
            except Exception as e:
                print(f"Can't convert {color}: {e}")

        with open(path, 'w') as out:
            out.write(dumps(palette))

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
    x256_palette = f"{path}_{theme}_256.json"
    if not exists(x256_palette):
        gen_256_pal(x256_palette)
    
    copyfile(x256_palette, "/tmp/mu_palette_256.json")
    info("Generated 256colors palette /tmp/mu_palette_256.json", "MU")

def load_themes_d():
    """
    Loads all scripts in themes.d
    """
    basepath = f"{realpath(dirname(__file__))}/themes.d"
    if exists(basepath):
        for file in listdir(basepath):
            info(f"Launching {file}", "THEMED")
            # Just spawn the files, don't care about interpreter and such
            Popen([f"{basepath}/{file}", "/tmp/mu_palette.json", "/tmp/mu_palette_256.json"], stdout=DEVNULL, stderr=DEVNULL)

