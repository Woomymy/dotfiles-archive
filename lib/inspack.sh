source "lib/colors.sh"
if [[ "$(grep $1 "/var/lib/portage/world")" ]]; then
	exit 
fi
greenprint "Installing packages ${1}"
echo "${1}" >> "tmp/packagelist"
