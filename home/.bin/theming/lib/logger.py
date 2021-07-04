def printc(color=97, msg=""):
    print(f"\x1b[{color}m{msg}\x1b[m")

def error(msg="", src="None"):
    printc(91, f"[ERROR] ({src.upper()}) -> {msg}")

def info(msg="", src="None"):
    printc(96, f"[INFO] ({src.upper()}) -> {msg}")


