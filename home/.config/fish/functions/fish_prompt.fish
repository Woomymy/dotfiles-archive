set red "\e[91m"
set cyan "\e[96m"
set magenta "\e[95m"
set reset "\e[0;m"
set bold "\e[1m"
function fish_prompt --description "Write the prompt"
	set prevstatus $status
	if not test $prevstatus = "0"
		set prompt_status "$red [$prevstatus]$reset"
	else
		set prompt_status ""
	end
	
	echo -nse "$magenta" "$USER" "$reset" @ (prompt_hostname) "$magenta" " " (prompt_pwd) "$reset" " (" (date +%H:%M) ")" "$cyan$bold" (fish_vcs_prompt) "$reset$red" "$prompt_status" "$magenta" " \$ "
end
