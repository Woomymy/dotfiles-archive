source "./lib/colors.sh"
run_syschecks(){
	check_is_archbased
	check_ping
}
check_is_archbased() {
	if [[ ! "$(command -v "yay")" ]]
	then
		redprint "This system isn't a calculate Linux System!"
		exit 1
	fi
}
check_ping() {
	ping -c 1 "github.com"
	if [[ $? != "0" ]]
	then 
		redprint "No internet connection aviable!"
		exit 1
	fi
}
