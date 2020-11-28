source "./lib/colors.sh"
source "./lib/insfuncs.sh"
source "./lib/inschecks.sh"
main() {
	if [[ -d "tmp" ]]
	then 
		rm -rf tmp 
	fi
	mkdir tmp
	cyanprint "Installing dotfiles..."
	cyanprint "Running checks..."
	run_syschecks
	greenprint "All checks OK!"
	install_dotfiles
}
