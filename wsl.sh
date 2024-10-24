function __wslu {
    wsl -d Ubuntu --mount D:/VHDX/apps.vhdx --vhd --bare > /dev/null
    ip=$(wsl -d Ubuntu hostname -I | xargs)
    net use Z: \\\\$ip\\apps
}

function __wsld {
    net use Z: //delete
    wsl -d Ubuntu --shutdown
}

alias wslu=__wslu
alias wsld=__wsld
