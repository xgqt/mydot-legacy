#!/bin/bash

# ~/.bashrc

#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|

# --- Kill Switch ---
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# --- Prompt --- 
PS1=$'\[$(tput bold)\]\[$(tput setaf 3)\] \w\[$(tput setaf 4)\] \u00BB \[$(tput sgr0)\]'
#PS1='\u@\h \w '

# --- History ---
HISTSIZE=3000
HISTFILESIZE=3000
# no double entries in the shell history
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"
# append histroy
shopt -s histappend

# --- User Settings ---
export EDITOR=nano

# --- Safety ---
# -- do not overwrite files when redirecting output by default
#set -o noclobber
# -- wrap these commands for interactive use to avoid accidental overwrites
alias rm="rm -Iv"
alias cp="cp -iv"
alias mv="mv -iv"

# --- Scripts ---
# -- add my scripts to PATH
export PATH=$PATH:$HOME/scripts
# -- archive extractor, originates from Manjaro
# usage: ex <file>
extractor ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# --- My Aliases ---
if [ -x $HOME/zsh.d/aliases ]; then
    . $HOME/zsh.d/aliases
fi
# -- auto-change directory
# allows you to cd into directory merely by typing the directory name
shopt -s autocd
