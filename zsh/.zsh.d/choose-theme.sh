#!/bin/sh
MYZSHDIR="$HOME/.zsh.d"
themedir=$MYZSHDIR/themes

themes=$(ls $themedir)

ls $themedir | nl
echo "choose a tty theme"
read tn1
theme1=$(echo $themes | cut -d" " -f$(echo $tn1))
echo "choose a emulator theme"
read tn2
theme2=$(echo $themes | cut -d" " -f$(echo $tn2))

ln -sf $themedir/$theme1 $MYZSHDIR/tty.zsh-theme
ln -sf $themedir/$theme2 $MYZSHDIR/emu.zsh-theme
