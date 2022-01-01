"""
Random utils
"""

from os import environ


def is_wayland():
    """
    Returns True if the session is a wayland session
    """

    return environ["XDG_SESSION_TYPE"] == "wayland"
