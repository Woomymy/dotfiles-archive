set red "\e[91m"
set cyan "\e[96m"
set magenta "\e[95m"
set reset "\e[m"
function fish_prompt --description "Write the prompt"
	set prevstatus $status
	if not test $prevstatus = "0"
		echo $prevstatus
		set prompt_status "$red [$prevstatus]$reset"
	else
		set prompt_status ""
	end
	
	echo -nse "$magenta" "$USER" "$reset" @ (prompt_hostname) "$magenta" " " (prompt_pwd) "$reset" " (" (date +%H:%M) ")" "$cyan" (fish_vcs_prompt) "$magenta" " \$ "
end
