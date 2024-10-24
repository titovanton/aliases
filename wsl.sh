function __wslu {
    wsl -d Ubuntu --mount D:/VHDX/apps.vhdx --vhd --bare
    wsl -d Ubuntu
}

alias wslu=__wslu
