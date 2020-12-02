configure_yay() {
	yay -Syyu
}
install_dotfiles() {
	cyanprint "Installing files and configuring system..."
	configure_portage
	cat systempackages | xargs -n 1 lib/inspack.sh 
	if [[ -f "tmp/packagelist" ]]
	then
		sudo yay -S $(cat "tmp/packagelist")
		if [[ $? != "0" ]]
		then
			redprint "Error installing packages!"
			exit 1
		fi
	fi
	cyanprint "Cleaning portage distfiles and unused dependencies"
	pacman -Scc	
}
