function rcenablenow
    set SERVICE $argv[1]
    
    if not test -f "/etc/init.d/$SERVICE"
        echo "Invalid service!"
        return 1
    end

    if test -n $argv[2]
        set RUNLEVEL $argv[2]
    else
        set RUNLEVEL default
    end

    sudo sh -c "rc-service $SERVICE start && rc-update add $SERVICE $RUNLEVEL"
end

