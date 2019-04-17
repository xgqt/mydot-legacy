#!/bin/zsh

#      _             _       
#  ___| | ___   __ _(_)_ __  
# |_  / |/ _ \ / _` | | '_ \ 
#  / /| | (_) | (_| | | | | |
# /___|_|\___/ \__, |_|_| |_|
#              |___/        

# --- MYZSHDIR Warning --- #
if [[ ! -d $MYZSHDIR ]]; then echo "Warning! no $MYZSHDIR found!"; exit 1; fi

# --- Warning message if a theme isn't set --- #
if [[ ! -e $MYZSHDIR/tty.zsh-theme || ! -e $MYZSHDIR/emu.zsh-theme ]]; then
    echo "Link one of themes in $MYZSHDIR/themes to $MYZSHDIR/tty.zsh-theme and one to $MYZSHDIR/emu.zsh-theme"
    $MYZSHDIR/choose-theme.sh
fi

# --- larrysay --- #
if [ -x /usr/bin/cowsay -a -x /usr/bin/fortune ]; then
    fortune | cowsay -f $MYZSHDIR/extra/larry.cow;
    zsh --version
fi
