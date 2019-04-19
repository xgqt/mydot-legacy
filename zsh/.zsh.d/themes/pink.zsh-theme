#!/bin/zsh

PROMPT=$'%F{pink}%M %F{blue}%5~ %(?.%F{blue}.%F{red})%(!.#.%%)%f '

RPROMPT=$'%(?.%F{pink}.%F{red})$(__git_ps1 "\ue0a0 %s")%f'
