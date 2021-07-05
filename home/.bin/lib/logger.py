from os import environ
def appendlog(msg=""):
    logpath = f"/tmp/{environ.get('USER')}-i3-session.log"
    try:
        with open(logpath, 'a') as logfile:
            logfile.write(msg)
        
    except:
        print(91, f"[ERROR] (LOGGER) -> Can't open /tmp/{logpath}")

def printc(color=97, msg=""):
    print(f"\x1b[{color}m{msg}\x1b[m")

def error(msg="", src="None"):
    logline = f"[ERROR] ({src.upper()}) -> {msg}"
    printc(91, logline)
    appendlog(logline)

def info(msg="", src="None"):
    logline = f"[INFO] ({src.upper()}) -> {msg}"
    printc(96, logline)
    appendlog(logline)

