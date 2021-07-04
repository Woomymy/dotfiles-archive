from urllib.request import urlopen
"""
Check if internet connection is aviable
"""
def check_inet():
    try:
        urlopen("https://kernel.org")
        return True
    except:
        return False
