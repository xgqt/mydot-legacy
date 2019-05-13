#!/bin/zsh

PROMPT=$'%B%F{red}\u279c %F{cyan}%1~%F{blue}$(__git_ps1 " git:(%s)" )%(?..%F{yellow} \u2718)%f%b '
