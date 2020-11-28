configure_portage() {
		cyanprint "Configuring portage..."
		PACKAGEDOT=(use accept_keywords mask unmask use)
		for DIR in ${PACKAGEDOT[*]} 
		do 
			sudo cp etc/portage/package.${DIR}/* /etc/portage/package.${DIR}/ 
		done
		sudo cp etc/portage/repos.conf/* /etc/portage/repos.conf/
		sudo eix-sync 
		# On calculate based systems,  eix-sync syncs also emerge (emerge --sync)
}
install_dotfiles() {
	cyanprint "Installing files and configuring system..."
	configure_portage
	cat "var/lib/portage/world" | xargs -n 1 lib/inspack.sh 
	if [[ -f "tmp/packagelist" ]]
	then
		sudo emerge $(cat "tmp/packagelist")
		if [[ $? != "0" ]]
		then
			redprint "Error installing packages!"
			exit 1
		fi
	fi
	cyanprint "Cleaning portage distfiles and unused dependencies"
	sudo eclean -d distfiles 
	sudo eclean -d packages 
	sudo emerge --depclean
	
}
