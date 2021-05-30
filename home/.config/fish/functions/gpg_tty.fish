function gpg_tty --description "Reset GPG_TTY"
        set -x GPG_TTY (tty)
end
