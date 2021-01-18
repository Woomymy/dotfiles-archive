#!/bin/bash
blue="blue"
darkblue="darkblue"
darkblue-alt="darkblue-alt"
green="green"
gray="gray"
lightblue="lightblue"
lightgreen="lightgreen"
lightturquoise="lightturquoise"
orange="orange"
pink="pink"
purple="purple"
red="red"
turquoise="turquoise"
yellow="yellow"
opts="$blue\n$darkblue\n${darkblue-alt}\n${green}\n${gray}\n$lightblue\n$lightgreen\n$lightturquoise\n$orange\n$pink\n$purple\n$red\n$turquoise\n$yellow"

ch="$(echo -e "$opts" | rofi -dmenu)"
case $ch in
    $blue)
        $HOME/bin/theming/setup-themes.sh $blue
        ;;
    $darkblue)
        $HOME/bin/theming/setup-themes.sh $darkblue
        ;;
    ${darkblue-alt})
        $HOME/bin/theming/setup-themes.sh ${darkblue-alt}
        ;;
    $green)
        $HOME/bin/theming/setup-themes.sh $green
        ;;
    $gray)
        $HOME/bin/theming/setup-themes.sh $gray
        ;;
    $lightblue)
        $HOME/bin/theming/setup-themes.sh $lightblue
        ;;
    $lightgreen)
        $HOME/bin/theming/setup-themes.sh $lightgreen
        ;;
    $lightturquoise)
        $HOME/bin/theming/setup-themes.sh $lightturquoise
        ;;
    $orange)
        $HOME/bin/theming/setup-themes.sh $orange
        ;;
    $pink)
        $HOME/bin/theming/setup-themes.sh $pink
        ;;
    $purple)
        $HOME/bin/theming/setup-themes.sh $purple
        ;;
    $red)
        $HOME/bin/theming/setup-themes.sh $red
        ;;
    $turquoise)
        $HOME/bin/theming/setup-themes.sh $turquoise
        ;;
    $yellow)
        $HOME/bin/theming/setup-themes.sh $yellow
        ;;    
esac

