#!/bin/zsh

PROMPT=$'%B%F{red}\u279c %F{cyan}%1~$(__git_ps1 "\e[34m git:(\e[31m%s\e[34m)")%(?..%F{yellow} \u2718)%f%b '
