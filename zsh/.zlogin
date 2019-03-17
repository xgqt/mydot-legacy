#!/bin/zsh

#      _             _       
#  ___| | ___   __ _(_)_ __  
# |_  / |/ _ \ / _` | | '_ \ 
#  / /| | (_) | (_| | | | | |
# /___|_|\___/ \__, |_|_| |_|
#              |___/        

# --- MYZSHDIR Warning --- #
if [[ ! -x $MYZSHDIR ]]; then echo "Warning! no $MYZSHDIR found!"; fi

# --- larrysay --- #
if [ -x /usr/bin/cowsay -a -x /usr/bin/fortune ]; then
    fortune | cowsay -f $MYZSHDIR/larry.cow;
    zsh --version
fi
