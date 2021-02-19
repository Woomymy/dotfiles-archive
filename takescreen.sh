#!/usr/bin/env bash
# Used to take screenshots
[[ "$(command -v maim)" ]] || exit 1
COLORS=(blue darkblue darkblue-alt green lightblue lightgreen lightturquoise orange pink purple red turquoise yellow)
if [[ ! -d "$PWD/screenshots" ]]
then
    mkdir "${PWD}/screenshots"
fi
if [[ -f "${PWD}/screenshots.md" ]]
then
    rm "${PWD}/screenshots.md"
fi
for COLOR in ${COLORS[*]}
do
    "${HOME}/bin/theming/setup-themes.sh" $COLOR
    sleep 3
    maim "${PWD}/screenshots/${COLOR}.png"
    echo "## $COLOR" >> "${PWD}/screenshots.md"
    echo "" >> "${PWD}/screenshots.md"
    echo "![${COLOR}](./screenshots/${COLOR}.png)" >> "${PWD}/screenshots.md"
    echo "" >> "${PWD}/screenshots.md"
done
