#!/usr/bin/env bash

get_color() {
    case $1 in 
        "blue")
            COLOR="#1E88E5"
	    BG="#F1F5F9"
	    ;;
        "darkblue")
            COLOR="#5E35B1"
	    BG="#F1F5F9"
	    ;;
        "green")
            COLOR="#43A047"
	    BG="#F1F5F9"
	    ;;
        "lightblue")
            COLOR="#039BE5"
	    BG="#F1F5F9"
	    ;;
        "lightgreen")
            COLOR="#7CB342"
	    BG="#F1F5F9"
	    ;;
        "lightturquoise")
            COLOR="#0097A7"
	    BG="#F1F5F9"
	    ;;
        "orange")
            COLOR="#FF6F00"
	    BG="#F1F5F9"
	    ;;
        "pink")
            COLOR="#D81B60"
            BG="#F1F5F9"
	    ;;
        "purple")
            COLOR="#8E24AA"
            BG="#F1F5F9"
	    ;;
        "red")
            COLOR="#E53935"
            BG="#F1F5F9"
	    ;;
        "turquoise")
            COLOR="#00897B"
            BG="#F1F5F9"
	    ;;
        "yellow")
            COLOR="#FBC02D"
            BG="#333"
	    ;;
        esac
        
}
