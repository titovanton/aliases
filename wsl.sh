function __wslu {
    # mount disk to the Ubuntu fs
    wsl -d Ubuntu --mount D:/VHDX/apps.vhdx --vhd --bare > /dev/null

    # keeps wsl alive
    wsl --exec dbus-launch true

    # mount apps to the Win fs
    ip=$(
        wsl -d Ubuntu ip addr show eth0 | \
        grep 'inet ' | awk '{print $2}' | \
        cut -d/ -f1 | \
        xargs
    )
    net use Z: \\\\$ip\\apps
}

function __wsld {
    net use Z: //delete
    wsl -d Ubuntu --shutdown
}

alias wslu=__wslu
alias wsld=__wsld
alias wsll="wsl -d Ubuntu -l -v"
