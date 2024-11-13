__apps_disk_label='Z:'

function __wslu {
    echo -e "\nMount vhdx disk to Ubuntu FS"
    wsl -d Ubuntu --mount D:/VHDX/apps.vhdx --vhd --bare

    echo -e "\nRun WSL and keep it alive"
    wsl --exec dbus-launch true

    echo -e "\nMount 'apps' to Win fs as '$__apps_disk_label' disk"
    ip=$(
        wsl -d Ubuntu ip addr show eth0 | \
        grep 'inet ' | awk '{print $2}' | \
        cut -d/ -f1 | \
        xargs
    )
    net use $__apps_disk_label \\\\$ip\\apps
}

function __wsld {
    echo -e "\nDelete '$__apps_disk_label'"
    net use Z: //delete

    echo -e "\nShut down WSL"
    wsl -d Ubuntu --shutdown
}

alias wslu=__wslu
alias wsld=__wsld
alias wsll="wsl -d Ubuntu -l -v"
