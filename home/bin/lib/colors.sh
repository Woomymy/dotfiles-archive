#!/usr/bin/env bash

get_color() {
    case $1 in 
        "blue")
            export COLOR="#1E88E5"
	    export BG="#F1F5F9"
	    ;;
        "darkblue")
            export COLOR="#5E35B1"
	    export BG="#F1F5F9"
	    ;;
        "green")
            export COLOR="#43A047"
	    export BG="#F1F5F9"
	    ;;
        "lightblue")
            export COLOR="#039BE5"
	    export BG="#F1F5F9"
	    ;;
        "lightgreen")
            export COLOR="#7CB342"
	    export BG="#F1F5F9"
	    ;;
        "lightturquoise")
            export COLOR="#0097A7"
	    export BG="#F1F5F9"
	    ;;
        "orange")
            export COLOR="#FF6F00"
	    export BG="#F1F5F9"
	    ;;
        "pink")
            export COLOR="#D81B60"
            export BG="#F1F5F9"
	    ;;
        "purple")
            export COLOR="#8E24AA"
            export BG="#F1F5F9"
	    ;;
        "red")
            export COLOR="#E53935"
            export BG="#F1F5F9"
	    ;;
        "turquoise")
            export COLOR="#00897B"
            export BG="#F1F5F9"
	    ;;
        "yellow")
            export COLOR="#FBC02D"
            export BG="#333"
	    ;;
        esac
        
}
