source "lib/colors.sh"
if [[ "$(yay -Qq | grep $1)" ]]; then
	exit 
fi
greenprint "Installing packages ${1}"
echo "${1}" >> "tmp/packagelist"
